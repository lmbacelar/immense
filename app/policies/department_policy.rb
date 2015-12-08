class DepartmentPolicy < ApplicationPolicy
  def index?
    admin? || manager? || auditor?
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
end
