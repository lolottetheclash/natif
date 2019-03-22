class OptionValuesController < ApplicationController
	before_action :set_option, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_admin

	def index
    @option_values = OptionValue.all
  end
    
  def new
    @option_value= OptionValue.new
  end
  
  def edit
  end
  
  def create
    @option_value= OptionValue.new(option_params)

    respond_to do |format|
	    if @option_value.save
	      format.html { redirect_to option_values_url, notice: "La valeur d'option a bien été enregistrée." }
	      format.json { render :index, status: :created, location: option_values_url}
	    else
	      format.html { render :new }
	      format.json { render json: @option_value.errors, status: :unprocessable_entity }
	    end
    end
  end
  
  def update
    respond_to do |format|
	    if @option_value.update(option_params)
	        format.html { redirect_to option_values_url, notice: "La valeur d'option a bien été mise à jour." }
	        format.json { render :index, status: :ok, location: options_url}
	    else
	        format.html { render :edit }
	        format.json { render json: @option_value.errors, status: :unprocessable_entity }
	    end
    end
  end
  
  def destroy
    @option_value.destroy
    respond_to do |format|
	    format.html { redirect_to option_values_url, notice: "La valeur d'option a bien été supprimée" }
	    format.json { head :no_content }
    end
  end
  
  private
    def set_option
    	@option_value= OptionValue.find(params[:id])
    end

    def option_params
    	params.require(:option_value).permit(:name, :option_id)
    end 
    
    def check_admin
      if RoleAssignation.find_by_user_id(current_user.id).role_id == 4 or RoleAssignation.find_by_user_id(current_user.id).role_id == 8
      else
        respond_to do |format|
          format.html { redirect_to request.referer }
          format.json { head :no_content }
        end
      end
    end
  end