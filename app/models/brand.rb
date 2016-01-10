class Brand < ActiveRecord::Base
  has_many :instruments
  has_many :models

  validates :name, uniqueness: true

  def to_s
    name
  end
end
