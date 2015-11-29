class InstrumentPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end
end
