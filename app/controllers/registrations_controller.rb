class RegistrationsController < Devise::RegistrationsController
	before_action :set_registration, only: [:show, :edit, :update]


	def show
 	end



 	private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @user = User.find(current_user.id)
    end

end




 	