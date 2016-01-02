class Instrument < ActiveRecord::Base

  # NOTE:
  # Manufacturer relation is redundant since model already defines its manufaturer.
  # It is included in the database to optimize searches using pg_search_scope.
  # Alternative: use multisearch and index methods :modl_name, manufacturer_name, ...

  belongs_to :department
  belongs_to :manufacturer
  belongs_to :model

  before_validation :set_model, :set_department

  validates_uniqueness_of :reference
  validates_presence_of   :reference, :designation,
                          :manufacturer, :manufacturer_name,
                          :model, :modl_name,
                          :department, :department_name

  attr_writer :manufacturer_name, :modl_name, :department_name

  include Serializable
  io_attributes :reference,:designation, :manufacturer_name, :modl_name, :part_number, :serial_number, :remarks, :department_name

  extend FriendlyId
  friendly_id :reference, use: :slugged

  include PgSearch
  pg_search_scope :full_text_search,
                     against: [ :reference, :designation, :serial_number ],
                     associated_against: { manufacturer: [:name],
                                           model:        [:name],
                                           department:   [:name] },
                     using: { tsearch: { dictionary: 'english', prefix: true } }
  def self.search query
    if query.present?
      full_text_search query
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
    def set_manufacturer
      self.manufacturer = Manufacturer.where(name: manufacturer_name || '').first_or_create
    end

    def set_model
      set_manufacturer
      self.model = self.manufacturer.models.where(name: modl_name || '').first_or_create
    end

    def set_department
      self.department = Department.where(name: department_name).first if department_name
    end
end
