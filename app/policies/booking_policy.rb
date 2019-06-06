class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def new?
      user.is_coach?
    end
    def resolve
      scope.where(coach: user)
    end
  end
end
