# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  content         :text
#  attachment_path :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  chat_room_id    :integer
#  user_id         :bigint
#

class Message < ApplicationRecord
  after_create :broadcast_message
  after_create :set_new

  belongs_to :user, optional: true
  belongs_to :chat_room

  # enum author: [:client, :coach]

  validates :content, presence: true, length: { minimum: 1,
    too_short:  "Votre message doit au moins contenir %{count} caractères" }

  def from?(some_user)
    some_user == user
  end

  def broadcast_message
    ActionCable.server.broadcast("chat_room_#{chat_room.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end

  def set_new
    if user.coach?
      ChatRoom.find(chat_room_id).update new_for_client: true
    else
      ChatRoom.find(chat_room_id).update new_for_coach: true
    end
  end
end
