class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ErrorHandling


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :email, :password, :password_confirmation])
  end
end
