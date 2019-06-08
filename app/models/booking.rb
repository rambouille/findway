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

  DAYS = { 1 => 'lundi', 2 => 'mardi', 3 => 'mercredi', 4 => 'jeudi',
           5 => 'vendredi', 6 => 'samedi', 7 => 'dimanche' }

  MONTHS = { 1 => 'janvier', 2 => 'février', 3 => 'mars', 4 => 'avril', 5 => 'mai',
             6 => 'juin', 7 => 'juillet', 8 => 'août', 9 => 'septembre',
             10 => 'octobre', 11 =>  'novembre', 12 => 'décembre' }

  belongs_to :coach, class_name: "User", foreign_key: "coach_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id", optional: true

  has_many :reviews

  enum state: %i[pending booked payed cancelled]
  enum video_channel: %i[skype hangout facetime]

  validate :end_must_be_after_start

  after_validation :set_amount

  def end_must_be_after_start
    if start_time >= end_time
      errors.add(:end_time, "l'horaire de fin doit être après l'horaire de début")
    end
  end

  def french_date
    date = start_time
    if date.today?
      "aujourd'hui"
    else
      day_in_week = date.strftime('%u').to_i
      day = date.strftime('%d').to_i
      month = date.strftime('%m').to_i
      "#{DAYS[day_in_week]} #{day} #{MONTHS[month]}"
    end
  end

  def time_slot
    "#{start_time.strftime('%Hh%M')} - #{end_time.strftime('%Hh%M')}"
  end

  private

  def set_amount
    self.amount_cents = self.coach.hourly_price_cents * (1 + COMMISSION_RATE)
  end
end
