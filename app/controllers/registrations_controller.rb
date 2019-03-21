class RegistrationsController < Devise::RegistrationsController
	before_action :set_registration, only: [:show, :edit, :update]


	def show
 	end
 	
  def update
    new_params = params.require(:user).permit(
      :gender,
      :firstname,
      :lastname,
      :username,
      :age,
      :avatar,
      :email,
      :password,
      :password_confirmation,
      :current_password
    )

    change_password = true
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation") 
      new_params = params.require(:user).permit(
        :gender,
        :firstname,
        :lastname,
        :username,
        :age,
        :avatar,
        :email,
        :current_password
      )
      change_password = false
    end

      @user = User.find(current_user.id)
      @user.skip_reconfirmation!
      @user.update_with_password(new_params)
      set_flash_message :notice, :updated
      sign_in :user, @user, bypass: true
      redirect_to mon_profil_path
    
  end


 	private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @user = User.find(current_user.id)
    end
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

end




 	