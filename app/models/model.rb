class Model < ActiveRecord::Base
  belongs_to :brand

  def brand_name
    brand&.name
  end
end
