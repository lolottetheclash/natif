class OptionAssociationsController < ApplicationController


    before_action :set_option, only: [:show, :edit, :update, :destroy]
    
    def index
        @option_associations = OptionAssociation.all
    end
    
    def new
        @option_association= OptionAssociation.new
    end
    
    def edit
    end
    
    def create
        @option_association= OptionAssociation.new(option_params)
    
        respond_to do |format|
        if @option_association.save
            format.html { redirect_to option_associations_url, notice: "La valeur d'option a bien été enregistrée." }
            format.json { render :index, status: :created, location: option_associations_url}
        else
            format.html { render :new }
            format.json { render json: @option_association.errors, status: :unprocessable_entity }
        end
        end
    end
    
    def update
        respond_to do |format|
        if @option_association.update(option_params)
            format.html { redirect_to option_associations_url, notice: "La valeur d'option a bien été mise à jour." }
            format.json { render :index, status: :ok, location: options_url}
        else
            format.html { render :edit }
            format.json { render json: @option_association.errors, status: :unprocessable_entity }
        end
        end
    end
    
    def destroy
        @option_association.destroy
        respond_to do |format|
        format.html { redirect_to option_associations_url, notice: "La valeur d'option a bien été supprimée" }
        format.json { head :no_content }
        end
    end
    
    private
    
        def set_option
        @option_association= OptionAssociation.find(params[:id])
        end
    
        def option_params
        params.require(:option_association).permit(:variant_id, :option_value_id)
        end       

end
