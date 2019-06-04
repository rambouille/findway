# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  firstname              :string           not null
#  lastname               :string           not null
#  description            :text             not null
#  age                    :integer          not null
#  status                 :integer          default("client")
#  linkedin               :string
#  address                :string
#  latitude               :float
#  longitude              :float
#  age_range              :string
#  study_scope            :string
#  business_expertise     :string
#  hourly_price_cents     :integer          default(0), not null
#  sype_username          :string
#  hangout_username       :string
#  facetime_username      :string
#  avatar                 :string
#  video                  :string
#

class User < ApplicationRecord
  has_many :client_bookings, class_name: "Booking", foreign_key: "client_id"
  has_many :coach_bookings, class_name: "Booking", foreign_key: "coach_id"

  has_many :client_messages, :class_name => "Message", :foreign_key => "client_id"
  has_many :coach_messages, :class_name => "Message", :foreign_key => "coach_id"

  has_many :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  monetize :hourly_price_cents
  enum status: [:client, :coach]

  mount_uploader :video, VideoUploader
  mount_uploader :avatar, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
