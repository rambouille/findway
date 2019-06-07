class CoachPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.coach
    end
  end
end
