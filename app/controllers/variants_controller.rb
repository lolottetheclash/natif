class VariantsController < ApplicationController
  before_action :set_variant, only: [:show, :edit, :update, :destroy]

  # GET /variants
  # GET /variants.json
  def index
    if params[:category]
      @variants = Variant.where(item_id: Item.where(category_id: Category.where(name: params[:category]).first.id).ids)
      if @variants.empty?
        flash[:error] = "There are <b>#{@variants.count}</b> in this category".html_safe
      else
        flash[:notice] = "There are <b>${@variants.count}</b> in this category".html_safe
      end
    else
      @variants = Variant.all
    end
  end

  # GET /variants/1
  # GET /variants/1.json
  def show
  end

  # GET /variants/new
  def new
    @variant = Variant.new
  end

  # GET /variants/1/edit
  def edit
  end

  # POST /variants
  # POST /variants.json
  def create
    @variant = Variant.new(variant_params)

    respond_to do |format|
      if @variant.save
        format.html { redirect_to @variant, notice: 'Variant was successfully created.' }
        format.json { render :show, status: :created, location: @variant }
      else
        format.html { render :new }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variants/1
  # PATCH/PUT /variants/1.json
  def update
    respond_to do |format|
      if @variant.update(variant_params)
        format.html { redirect_to @variant, notice: 'Variant was successfully updated.' }
        format.json { render :show, status: :ok, location: @variant }
      else
        format.html { render :edit }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1
  # DELETE /variants/1.json
  def destroy
    optionsofvariant = OptionAssociation.where(variant_id: @variant.id)
    optionsofvariant.each do |element|
      element.destroy
    end
    @variant.destroy
    respond_to do |format|
      format.html { redirect_to variants_url, notice: 'Variant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variant_params
      params.require(:variant).permit(:title, :item_id, :price, :stock)
    end
end
