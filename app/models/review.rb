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

class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  validates :content, presence: true, length: { minimum: 2,
    too_short: "Votre avis doit au moins contenir %{count} caractères" }
  validates :rating, presence: true

end
