class Department < ActiveRecord::Base
  has_ancestry

  validates :name, uniqueness: { scope: :ancestry }

  def to_s
    [ancestors.collect(&:name), name].join '/'
  end
end
