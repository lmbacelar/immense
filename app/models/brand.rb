class Brand < ActiveRecord::Base
  has_many :instruments
  has_many :models
end
