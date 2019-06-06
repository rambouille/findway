class CoachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  def index
    @users = User.where(status: "coach")
    if params[:speciality].present?
      @users = @users.where(speciality: params[:speciality])
    end
    if params[:business_expertise].present?
      @users = @users.where(business_expertise: params[:business_expertise])
    end
    if params[:price_min].present?
      @users = @users.where("hourly_price_cents >= #{params[:price_min].to_i * 100}")
    end
    if params[:price_max].present?
      @users = @users.where("hourly_price_cents <= #{params[:price_max].to_i * 100}")
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
