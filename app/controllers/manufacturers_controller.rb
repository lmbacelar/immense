class ManufacturersController < ApplicationController
  def autocomplete
    manufacturers = Manufacturer.where("name ilike '%#{params[:term]}%'").order(:name)
    authorize manufacturers
    render json: manufacturers.pluck(:name)
  end
end
