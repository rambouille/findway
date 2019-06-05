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
#  amount_cents  :integer
#  video_channel :integer
#  client_need   :text
#  payment       :jsonb
#  state         :integer          default("pending")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


class Booking < ApplicationRecord
  COMMISSION_RATE = 0.1

  belongs_to :coach, class_name: "User", foreign_key: "coach_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id", optional: true

  has_many :reviews

  enum state: [:pending, :booked, :payed, :passed, :cancelled]
  enum video_channel: [:skype, :hangout, :facetime]

  after_validation :set_amount

  def set_amount
    self.amount_cents = self.coach.hourly_price_cents * (1 + COMMISSION_RATE)
  end
end
