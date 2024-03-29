class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ErrorHandling
  # include Pundit::Authorization
  include Authorization


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:first_name, :last_name, :nickname, :phone_number, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nickname, :phone_number, :email], except: [:password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in,        keys: [:email, :password])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || books_path
  end
end
