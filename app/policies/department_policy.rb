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

  def autocomplete?
    # TODO: limit to departments owned by user
    true
  end
end
