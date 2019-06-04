# == Schema Information
#
# Table name: bookings
#
#  id            :bigint           not null, primary key
#  client_id     :bigint
#  coach_id      :bigint
#  start_time    :datetime
#  end_time      :datetime
#  weekly        :boolean
#  amount        :float
#  video_channel :integer
#  client_need   :text
#  payment       :jsonb
#  state         :integer          default("pending")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :coach, class_name: "User", foreign_key: "coach_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id"

  has_many :reviews

  enum state: [:pending, :booked, :payed]
end
