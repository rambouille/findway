class Api::V1::AvailabilitiesController < Api::V1::BaseController
  def index
    coach     = User.coach.find(params[:coach_id])
    @bookings = policy_scope(coach.coach_bookings, policy_scope_class: BookingPolicy::VisitorScope)
  end
end
