class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @bookings = policy_scope(Booking)
  end
end
