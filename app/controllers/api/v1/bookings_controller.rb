class Api::V1::BookingsController < Api::V1::BaseController
  def index
    @bookings = policy_scope(Booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    # head :no_content
  end
end
