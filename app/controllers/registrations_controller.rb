class RegistrationsController < Devise::RegistrationsController
	before_action :set_registration, only: [:show, :edit, :update]


	def show
 	end

 	def update

    respond_to do |format|
      if @user.update(post_params)
        format.html { redirect_to my_profile(@user), notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

 	end



 	private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @user = User.find(current_user.id)
    end

end




 	