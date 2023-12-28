class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :user_name, :user_icon])
    devise_parameter_sanitizer.permit(:login, keys: [:login])
  end
end