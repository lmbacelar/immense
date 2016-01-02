class Model < ActiveRecord::Base
  belongs_to :manufacturer

  def manufacturer_name
    manufacturer&.name
  end
end
