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

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
