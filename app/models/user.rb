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

SPECIALIZATIONS = ["reconversion professionnelle", "conseiller d'orientation", "coaching personnalisé"]

BUSINESS_EXPERTISES = [
  "AGRICULTURE - BOIS",
  "ARCHITECTURE - PAYSAGE - URBANISME",
  "ARMÉE - SÉCURITÉ",
  "ARTS - ARTISANAT - CULTURE",
  "ASSURANCE - BANQUE",
  "AUDIOVISUEL - INFORMATION - COMMUNICATION",
  "CONSTRUCTION DURABLE - BÂTIMENT ET TRAVAUX PUBLICS",
  "DROIT - ÉCONOMIE - GESTION",
  "ENSEIGNEMENT - RECHERCHE",
  "ÉNERGIES - ENVIRONNEMENT",
  "GESTION ADMINISTRATIVE - TRANSPORT - LOGISTIQUE",
  "HÔTELLERIE - RESTAURATION - TOURISME",
  "INDUSTRIES",
  "INFORMATIQUE - INTERNET",
  "RELATION CLIENT (ACCUEIL - RELATION CLIENT, COMMERCE, VENTE)",
  "SANTÉ - SOCIAL - SPORT",
  "TOUS SECTEURS"
].freeze

class User < ApplicationRecord
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

  validates :business_expertise, inclusion: { in: BUSINESS_EXPERTISES, message: "Vous devez choisir dans la liste!" }
  validates :speciality, inclusion: { in: SPECIALIZATIONS, message: "Vous devez choisir dans la liste!" }

  validates :speciality, presence: true, if: :coach?
  validates :business_expertise, presence: true, if: :coach?
  validates :hourly_price_cents, presence: true, if: :coach?

  # def coach?
  #   self.coach?
  # end

  def fullname
    "#{firstname.capitalize} #{lastname.capitalize}"
  end
end
