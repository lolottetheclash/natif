class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password, :current_page])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :lastname, :firstname, :email, :password, :password_confirmation, :current_page])
    end
  	def referer
    	@env['HTTP_REFERER'] || '/'
  	end
end