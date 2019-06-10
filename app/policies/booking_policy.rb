class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def show?
      record.state == 'pending' || record.coach == user || record.client == user
    end

    def new?
      user.is_coach?
    end

    def destroy?
      record.coach == user || record.client == user
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
