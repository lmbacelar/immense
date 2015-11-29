class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  after_action :verify_authorized, unless: :devise_controller?

  before_action :authenticate_user!, unless: :devise_controller?
end
