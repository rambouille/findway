class Api::V1::BookingsController < Api::V1::BaseController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
  end

  def create
    # attention : - 2.hour pour pallier au decalage horaire
    start_time = params.keys.first.to_datetime - 2.hour
    end_time = start_time + 1.hour
    @booking = Booking.new(start_time: start_time, end_time: end_time)
    @booking.coach = current_user
    @booking.save
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

  def booking_params
    params.require(:booking).permit(:start_time)
  end
end
