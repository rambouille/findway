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
  belongs_to :user, optional: true
  belongs_to :chat_room

  # enum author: [:client, :coach]

  validates :content, presence: true, length: { minimum: 1,
    too_short:  "Votre message doit au moins contenir %{count} caractères" }

  def from?(some_user)
    some_user == user
  end
end
