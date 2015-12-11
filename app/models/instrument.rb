class Instrument < ActiveRecord::Base

  belongs_to :department

  validates :reference,   presence: true, uniqueness: true
  validates :designation, presence: true
  validates :department,  presence: true

  include Serializable
  io_attributes :reference,:designation, :manufacturer, :model, :part_number, :serial_number, :remarks, :department_name

  extend FriendlyId
  friendly_id :reference, use: :slugged

  include PgSearch
  pg_search_scope :full_text_search,
                     against: [ :reference, :designation, :manufacturer, :model, :serial_number ],
                     using: { tsearch: { dictionary: 'english', prefix: true } }
  def self.search query
    if query.present?
      full_text_search query
    else
      order 'created_at DESC'
    end
  end

  def department_name
    department.name
  end

  def department_name= name
    self.department = Department.find_by_name name
  end
end
