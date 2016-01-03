class Model < ActiveRecord::Base
  belongs_to :brand_object, class_name: 'Brand', foreign_key: :brand_id

  def brand
    brand_object&.name
  end
end
