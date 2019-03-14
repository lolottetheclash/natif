class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :lastname, :firstname, :age])
    devise_parameter_sanitizer.permit(:update, keys: [:username, :lastname, :firstname, :email, :age, :password, :password_confirmation])
  end
end



