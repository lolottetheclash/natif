class OptionsController < ApplicationController
	before_action :set_option, only: [:show, :edit, :update, :destroy]
 	
 	def index
    @options = Option.all
 	end

 	def new
    @option= Option.new
 	end

	def edit
	end

 	def create
    @option= Option.new(option_params)

    respond_to do |format|
    	if @option.save
        format.html { redirect_to options_url, notice: 'option was successfully created.' }
        format.json { render :index, status: :created, location: options_url}
     	else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
     end
    end
 	end

 	def update
    respond_to do |format|
     	if @option.update(option_params)
        format.html { redirect_to options_url, notice: 'option was successfully updated.' }
        format.json { render :index, status: :ok, location: options_url}
     	else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
     	end
    end
 	end

 	def destroy
    @option.destroy
    respond_to do |format|
     	format.html { redirect_to options_url, notice: 'Option was successfully destroyed.' }
     	format.json { head :no_content }
    end
 	end

 	private
    def set_option
     	@option= Option.find(params[:id])
    end

    def option_params
     	params.require(:option).permit(:name)
    end
end