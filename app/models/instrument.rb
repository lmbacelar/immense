class Instrument < ActiveRecord::Base
  belongs_to :department
  belongs_to :model

  before_validation :set_model, :set_department

  validates_uniqueness_of :reference
  validates_presence_of   :reference, :designation,
                          :manufacturer_name,
                          :model, :modl_name,
                          :department, :department_name

  attr_writer :manufacturer_name, :modl_name, :department_name

  include Serializable
  io_attributes :reference,:designation, :manufacturer_name, :modl_name, :part_number, :serial_number, :remarks, :department_name

  extend FriendlyId
  friendly_id :reference, use: :slugged

  include PgSearch
  multisearchable against: [ :reference, :designation, :manufacturer_name, :modl_name, :serial_number, :department_name ]

  def self.search query
    if query.present?
      found_ids = PgSearch.multisearch(query).where(searchable_type: self.name).map(&:searchable_id)
      where id: found_ids
    else
      order 'created_at DESC'
    end
  end

  def manufacturer_name
    @manufacturer_name ||= model&.manufacturer_name
  end

  def modl_name
    @modl_name ||= model&.name
  end

  def department_name
    @department_name ||= department&.name
  end

  private
    def set_model
      manufacturer = Manufacturer.where(name: manufacturer_name || '').first_or_create
      self.model = manufacturer.models.where(name: modl_name || '').first_or_create
    end

    def set_department
      self.department = Department.where(name: department_name).first if department_name
    end
end
