class Department < ActiveRecord::Base

  SEPARATOR = '/'

  include ObjectBelongable
  belongs_to_object :company
  belongs_to :parent,   class_name: 'Department'
  has_many   :children, class_name: 'Department', foreign_key: :parent_id
  has_many   :instruments

  validates :name, presence: true, uniqueness: true
  validate  :parent_existence

  default_scope { order 'name ASC' }

  include Serializable
  io_attributes :name,:designation

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.search query
    if query.present?
      where "name ilike '%#{query}%' OR designation ilike '%#{query}%'"
    else
      all
    end
  end

  def company= value
    self.company_object = Company.find_by_short_name value
  end

  def short_name
    name.split(SEPARATOR).last
  end

  def parent_name
    name.split(SEPARATOR)[0..-2].join(SEPARATOR)
  end

  def to_s
    name
  end

  private
    def parent_existence
      if parent_name.present?
        @parent = Department.find_by_name parent_name
        unless @parent
          errors.add :name, "parent department '#{parent_name}' must exist"
        end
      end
    end
end
