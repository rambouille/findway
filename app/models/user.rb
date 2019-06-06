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
#  speciality             :string
#  business_expertise     :string
#  hourly_price_cents     :integer          default(0), not null
#  skype_username         :string
#  hangout_username       :string
#  facetime_username      :string
#  avatar                 :string
#  video                  :string
#

class User < ApplicationRecord
  SPECIALIZATIONS = ["reconversion professionnelle", "conseiller d'orientation", "coaching personnalisé"]

  BUSINESS_EXPERTISES = [
    'agriculture - bois',
    'architecture - paysage - urbanisme',
    'armée - sécurité',
    'arts - artisanat - culture',
    'assurance - banque',
    'audiovisuel - information - communication',
    'construction durable - bâtiment et travaux publics',
    'droit - économie - gestion',
    'enseignement - recherche',
    'énergies - environnement',
    'gestion administrative - transport - logistique',
    'hôtellerie - restauration - tourisme',
    'industries',
    'informatique - internet',
    'relation client (accueil - relation client, commerce, vente)',
    'santé - social - sport',
    'tous secteurs']
.freeze

  has_many :client_bookings, class_name: "Booking", foreign_key: "client_id"
  has_many :coach_bookings, class_name: "Booking", foreign_key: "coach_id"

  has_many :client_messages, class_name: "Message", foreign_key: "client_id"
  has_many :coach_messages, class_name: "Message", foreign_key: "coach_id"

  has_many :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  monetize :hourly_price_cents
  enum status: [:client, :coach]

  mount_uploader :video, VideoUploader
  mount_uploader :avatar, PhotoUploader

  with_options if: :is_coach? do |coach|
    coach.validates :speciality, presence: true, inclusion: { in: SPECIALIZATIONS, message: "Vous devez choisir dans la liste!" }
    coach.validates :business_expertise, presence: true, inclusion: { in: BUSINESS_EXPERTISES, message: "Vous devez choisir dans la liste!" }
    coach.validates :hourly_price_cents, presence: true
  end

  def fullname
    "#{firstname.capitalize} #{lastname.capitalize}"
  end

  def is_coach?
    status == "coach"
  end
end
