class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where("crowdfunding_end_date > ?", Date.today)
      scope.all
    end
  end

  def show?
    true
  end


end
