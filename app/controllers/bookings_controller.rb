class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [ :new ]


  # Cette action est pour es coaches
  def index
    @bookings = current_user.coach_bookings
    @future_bookings = @bookings.booked.where("start_time > ?", Time.now).order(:start_time)
    @past_bookings = @bookings.booked.where("end_time < ?", Time.now).order(start_time: :DESC)
    @booking = Booking.new
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # Attention: si modif des champs du front il faudra modifier ce code
    @booking.end_time = "#{@booking.start_time.to_date.strftime('%Y-%m-%d')} #{params[:booking]["end_time(4i)"]}:#{params[:booking]["end_time(5i)"]}"
    @booking.coach = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to '/bookings'
  end

  def dashboard_client
    @bookings = current_user.client_bookings
    @future_bookings = @bookings.where("start_time > ?", Time.now).order(:start_time)
    @past_bookings = @bookings.where("end_time < ?", Time.now).order(start_time: :DESC)
  end

  private

  def set_user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:start_time, :weekly)
  end
end
