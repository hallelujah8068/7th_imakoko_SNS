class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :render404

  def render404(error = nil)
    Rails.logger.error("❌#{error.message}") if error
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :user_name, :user_icon])
    devise_parameter_sanitizer.permit(:login, keys: [:login])
  end
end