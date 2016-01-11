module ObjectBelongable
  extend ActiveSupport::Concern
  module ClassMethods
    def belongs_to_object resource
      resource_object = "#{resource}_object".to_sym

      # set association
      belongs_to  resource_object, class_name: resource.capitalize, foreign_key: "#{resource}_id".to_sym

      # define resource reader
      define_method resource do
        ( send(resource_object) || instance_variable_get("@#{resource}") ).to_s
      end
    end
  end
end
