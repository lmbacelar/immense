class BrandsController < ApplicationController
  def autocomplete
    brands = Brand.where("name ilike '%#{params[:term]}%'").order(:name)
    authorize brands
    render json: brands.pluck(:name)
  end
end
