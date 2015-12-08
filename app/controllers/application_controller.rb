class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  after_action :verify_authorized, unless: :devise_controller?

  before_action :authenticate_user!, unless: :devise_controller?

  private
    def set_filename_and_render
      response.headers["Content-Disposition"] = "attachment; filename=\"#{export_filename}\""
    end

    def export_filename
      "#{params[:controller]}_#{Time.zone.now.strftime('%Y%m%d_%H%M%S')}.#{params[:format]}"
    end
end
