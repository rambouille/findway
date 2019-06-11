class ChatRoom < ApplicationRecord
  has_many :messages
  belongs_to :coach, class_name: "User", foreign_key: "coach_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id", optional: true
end
