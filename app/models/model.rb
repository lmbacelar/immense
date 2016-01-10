class Model < ActiveRecord::Base
  include ObjectBelongable
  belongs_to_object :brand

  def to_s
    name
  end
end
