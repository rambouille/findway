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

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
