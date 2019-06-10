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
    @next_slot = @user.coach_bookings.where("start_time > ?", Time.now).order(:start_time).first
  end
end
