class Instrument < ActiveRecord::Base
  include ObjectBelongable
  belongs_to_object :model
  belongs_to_object :department

  before_validation :set_model_object, :set_department_object

  validates_uniqueness_of :reference
  validates_presence_of   :reference, :designation, :company, :department

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

  attr_writer :brand, :model, :company, :department
  delegate    :brand,   to: :model_object,      allow_nil: true
  delegate    :company, to: :department_object, allow_nil: true

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
      brand_object      = Brand.where(name: @brand || '').first_or_create
      self.model_object = brand_object.models.where(name: @model || '').first_or_create
    end

    def set_department_object
      if @company && @department
        company_object         = Company.where(short_name: @company).first
        self.department_object = company_object.departments.where(name: @department).first
      end
    end
end
