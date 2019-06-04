# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  client_id       :bigint
#  coach_id        :bigint
#  content         :text
#  from_coach      :boolean
#  attachment_path :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :coach, class_name: "User", foreign_key: "coach_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id"

  enum author: [:client, :coach]
end
