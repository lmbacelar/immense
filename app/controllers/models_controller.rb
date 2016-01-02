class ModelsController < ApplicationController
  def autocomplete
    models = Model.where("name ilike '%#{params[:term]}%'").order(:name)
    authorize models
    render json: models.pluck(:name)
  end
end
