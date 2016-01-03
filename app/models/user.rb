class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :department_object, class_name: 'Department', foreign_key: :department_id

  def department
    department_object.name
  end

  def department= name
    self.department_object = Department.find_by_name name
  end
end
