class Instrument < ActiveRecord::Base
  belongs_to :department_object, class_name: 'Department', foreign_key: :department_id, required: true
  belongs_to :model_object,      class_name: 'Model',      foreign_key: :model_id,      required: true

  before_validation :set_model_object, :set_department_object

  validates_uniqueness_of :reference
  validates_presence_of   :reference, :designation, :department

  attr_writer :brand, :model, :department

  include Serializable
  io_attributes :reference,:designation, :brand, :model, :part_number, :serial_number, :remarks, :department

  extend FriendlyId
  friendly_id :reference, use: :slugged

  include PgSearch
  multisearchable against: [:reference, :designation, :brand, :model, :serial_number, :department]

  def self.search query
    if query.present?
      found_ids = PgSearch.multisearch(query).where(searchable_type: self.name).map(&:searchable_id)
      where id: found_ids
    else
      order 'created_at DESC'
    end
  end

  def brand
    @brand ||= model_object&.brand
  end

  def model
    @model ||= model_object&.name
  end

  def department
    @department ||= department_object&.name
  end

  def validate_ownership user
    if department.include? user.department
      true
    else
      errors.add :department, 'must be owned by you'
      false
    end
  end

  private
    def set_model_object
      brand_object = Brand.where(name: brand || '').first_or_create
      self.model_object = brand_object.models.where(name: model || '').first_or_create
    end

    def set_department_object
      self.department_object = Department.where(name: department).first if department
    end
end
