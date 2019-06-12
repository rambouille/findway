# == Schema Information
#
# Table name: chat_rooms
#
#  id             :bigint           not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  client_id      :bigint
#  coach_id       :bigint
#  new_for_client :boolean
#  new_for_coach  :boolean
#

class ChatRoom < ApplicationRecord
  has_many :messages
  belongs_to :coach, class_name: "User", foreign_key: "coach_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id", optional: true
end
