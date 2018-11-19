class InvestmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def new?
    true
  end

  def create?
    new?
  end
end
