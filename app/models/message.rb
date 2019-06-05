# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  client_id       :bigint
#  coach_id        :bigint
#  content         :text
#  attachment_path :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author          :integer          default("client")
#

class Message < ApplicationRecord
  belongs_to :coach, class_name: "User", foreign_key: "coach_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id"

  enum author: [:client, :coach]

  validates :content, presence: true, length: { minimum: 2,
    too_short:  "Votre message doit au moins contenir %{count} caractères" }
end
