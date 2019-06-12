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

require 'test_helper'

class ChatRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
