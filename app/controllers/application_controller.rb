class ApplicationController < ActionController::Base
	def referer
  	@env['HTTP_REFERER'] || '/'
	end
end
