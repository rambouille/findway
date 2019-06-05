class CoachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if params[:speciality].present?
      @users = User.where(speciality: params[:speciality])
    else
      @users = User.all
    end
  end
end
