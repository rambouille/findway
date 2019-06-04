# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  booking_id :bigint
#  user_id    :bigint
#  content    :string
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
