class Api::V1::BookingsController < Api::V1::BaseController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
  end

  def destroy
    authorize @booking
    @booking.destroy
    # head :no_content
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
