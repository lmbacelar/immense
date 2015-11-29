class ApplicationPolicy
  attr_reader :user, :record

  def initialize user, record
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def new?
    create?
  end

  def create?
    false
  end

  def edit?
    update?
  end

  def update?
    false
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope! user, record.class
  end

  class Scope
    attr_reader :user, :scope

    def initialize user, scope
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end

  private
    def owned_by? a_user
      record.user == a_user
    end

    def owner?
      owned_by? @user
    end
end