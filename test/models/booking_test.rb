# == Schema Information
#
# Table name: bookings
#
#  id            :bigint           not null, primary key
#  client_id     :bigint
#  coach_id      :bigint
#  start_time    :datetime
#  end_time      :datetime
#  weekly        :boolean
#  amount        :float
#  video_channel :integer
#  client_need   :text
#  payment       :jsonb
#  state         :integer          default("pending")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
