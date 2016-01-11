class InstrumentPolicy < ApplicationPolicy
  def index?
    admin? || manager? || auditor?
  end

  def new?
    admin? || manager?
  end

  def create?
    admin? || (manager? && owner?)
  end

  def update?
    admin? || (manager? && owner?)
  end

  def destroy?
    admin? || (manager? && owner?)
  end

  def import?
    admin?
  end

  def edit_company?
    admin?
  end
end
