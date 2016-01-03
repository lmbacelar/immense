class ModelsController < ApplicationController
  def autocomplete
    brand = Brand.find_by name: params[:brand_name]
    models = brand.models.where("name ilike '%#{params[:term]}%'").order(:name)
    authorize models
    render json: models.pluck(:name)
  end
end
