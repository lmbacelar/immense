class Instrument < ActiveRecord::Base

  belongs_to :department
  belongs_to :manufacturer

  validates :reference,     presence: true, uniqueness: true
  validates :designation,   presence: true
  validates :manufacturer,  presence: true
  validates :department,    presence: true

  include Serializable
  io_attributes :reference,:designation, :manufacturer_name, :model, :part_number, :serial_number, :remarks, :department_name

  extend FriendlyId
  friendly_id :reference, use: :slugged

  include PgSearch
  pg_search_scope :full_text_search,
                     against: [ :reference, :designation, :model, :serial_number ],
                     associated_against: { manufacturer: [:name], department: [:name] },
                     using: { tsearch: { dictionary: 'english', prefix: true } }
  def self.search query
    if query.present?
      full_text_search query
    else
      order 'created_at DESC'
    end
  end

  def manufacturer_name
    manufacturer.try :name
  end

  def manufacturer_name= name
    self.manufacturer = Manufacturer.where(name: name).first_or_create if name
  end

  def department_name
    department.try :name
  end

  def department_name= name
    self.department = Department.where(name: name).first if name
  end
end
