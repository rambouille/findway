class Api::V1::CoachesController < Api::V1::BaseController
  def index
    @coaches = policy_scope(User, policy_scope_class: CoachPolicy::Scope)
  end
end
