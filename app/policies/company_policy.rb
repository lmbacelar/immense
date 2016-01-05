class CompanyPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  def import?
    admin?
  end

  def autocomplete?
    admin? || manager? || auditor?
  end
end
