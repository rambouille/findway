class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def new?
      user.is_coach?
    end
    def resolve
      scope.where(coach: user)
    end
  end

  class VisitorScope < Scope
    def resolve
      scope.where(state: 'pending')
    end
  end
end
