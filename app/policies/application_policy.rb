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
      record.department.include? a_user.department
    end

    def owner?
      owned_by? @user
    end

    def admin?;   user.role == 'admin'   end
    def manager?; user.role == 'manager' end
    def auditor?; user.role == 'auditor' end
    def guest?;   user.role == 'guest'   end
end
