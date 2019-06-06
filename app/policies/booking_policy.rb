class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(coach: user)
    end
  end
end
