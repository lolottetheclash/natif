class ApplicationController < ActionController::Base

	load_and_authorize_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:gender, :username, :lastname, :firstname, :age, :email, :password, :password_confirmation])
  end
	def referer
  	@env['HTTP_REFERER'] || '/'
	end
end



