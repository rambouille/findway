class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :test]

  def home
  end

  def test
    @booking = Booking.last
  end
end
