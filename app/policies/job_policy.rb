class JobPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    record.employer == user
  end

  def show?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end
end
