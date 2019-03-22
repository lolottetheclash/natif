class VariantsController < ApplicationController
  before_action :set_variant, only: [:show, :edit, :update, :destroy]

  def index
    array = nil
    params.each do |key, value|
      array = value if Option.all.map(&:name).include?(key)
    end

    if params[:category]
      @variants = Variant.where(item_id: Item.where(category_id: Category.where(name: params[:category]).first.id).ids).order(:title).page(params[:page]).per(6)
    elsif array != nil
      @variants = Variant.where(id: OptionAssociation.where(option_value_id: OptionValue.find_by_name(array)).ids).order(:title).page(params[:page]).per(6)
    else
      @variants = Variant.where(["title ILIKE ?","%#{params[:search]}%"]).page(params[:page]).per(6)
    end
  end

  def show
    @reviews = Review.where(item_id:(@variant.item_id))
  end

  def new
    @variant = Variant.new
  end

  def edit
  end

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
    def set_variant
      @variant = Variant.find(params[:id])
    end

    def variant_params
      params.require(:variant).permit(:title, :item_id, :price, :stock)
    end
end