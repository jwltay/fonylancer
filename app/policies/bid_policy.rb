class BidPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user == scope[0].job.employer
        scope.all
      else
        scope.none
      end
    end
  end
end
