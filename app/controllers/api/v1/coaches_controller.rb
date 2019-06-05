class Api::V1::CoachesController < Api::V1::BaseController
  def index
    @coaches = policy_scope(Coach)
  end
end
