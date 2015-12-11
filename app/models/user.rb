class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :department

  def department_name
    department.name
  end

  def department_name= name
    self.department = Department.find_by_name name
  end
end
