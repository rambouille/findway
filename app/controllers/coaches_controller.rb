class CoachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  def index
    @users = User.coach
    @users = @users.where(speciality: params[:speciality]) if params[:speciality].present?
    @users = @users.where(business_expertise: params[:business_expertise]) if params[:business_expertise].present?
    @users = @users.where("hourly_price_cents >= #{params[:price_min].to_i * 100}") if params[:price_min].present?
    @users = @users.where("hourly_price_cents <= #{params[:price_max].to_i * 100}") if params[:price_max].present?
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.coach_bookings.reviews
    raise
    @next_slot = @user.coach_bookings.where("start_time > ?", Time.now).where(client: nil).order(:start_time).first
  end

  def see_slots
    @coach = User.find(params[:coach_id])
    @bookings = @coach.coach_bookings.where("start_time > ?", Time.now).where(client: nil).order(:start_time)
  end

  def book
    @booking = Booking.find(params[:booking_id])
    @price = @booking.coach.hourly_price_cents * (@booking.end_time - @booking.start_time) / 3600 /100
  end

  def edit_booking
    @booking = Booking.find(params[:booking_id])
    @booking.client = current_user
    @booking.save
    redirect_to coach_path(@booking.coach)
  end
end
