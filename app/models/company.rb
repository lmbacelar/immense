class Company < ActiveRecord::Base
  has_many  :departments

  validates :short_name, presence: true, uniqueness: true
  validates :name,       presence: true, uniqueness: true
  validates :vat_number, presence: true, uniqueness: true
  validates :vat_prefix, presence: true

  include Serializable
  io_attributes :short_name, :name, :vat_number, :vat_prefix

  extend FriendlyId
  friendly_id :short_name, use: :slugged

  def self.search query
    if query.present?
      where "vat_number = '#{query}' OR
             vat_prefix = '#{query}' OR
             short_name ilike '%#{query}' OR
             name ilike '%#{query}%'"
    else
      all
    end
  end

  def to_s
    short_name
  end
end
