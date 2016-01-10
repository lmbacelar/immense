class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include ObjectBelongable
  belongs_to_object :department

  def department= name
    self.department_object = Department.find_by_name name
  end

  def departments
    Department.where "name ilike '#{department}%'"
  end
end
