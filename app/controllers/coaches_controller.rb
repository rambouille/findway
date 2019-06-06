class CoachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  def index
    if params[:speciality].present?
      @users = User.where(speciality: params[:speciality])
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
