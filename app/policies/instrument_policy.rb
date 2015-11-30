class InstrumentPolicy < ApplicationPolicy
  def index?
    admin? || manager? || auditor?
  end

  def create?
    admin? || manager?
  end

  def update?
    admin? || (manager? && owner?)
  end

  def destroy?
    admin? || (manager? && owner?)
  end
end
