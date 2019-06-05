# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  firstname              :string           not null
#  lastname               :string           not null
#  description            :text             not null
#  age                    :integer          not null
#  status                 :integer          default("client")
#  linkedin               :string
#  speciality             :string
#  business_expertise     :string
#  hourly_price_cents     :integer          default(0), not null
#  skype_username         :string
#  hangout_username       :string
#  facetime_username      :string
#  avatar                 :string
#  video                  :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
