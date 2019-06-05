class BookingsController < ApplicationController
  def index
    @bookings = current_user.coach_bookings
  end
end
