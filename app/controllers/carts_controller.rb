class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :additem, :removeitem]
  before_action :authenticate_user!

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.where(user_id: current_user.id).where(order_id: nil).order(:id)
    @carts.empty? ? countCart = 0 : countCart = @carts.size 
    @amount = @carts.map(&:total_per_item).instance_eval { reduce(:+) }

    if @carts.empty?
      flash.now[:alert] = "Votre panier est vide"
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to request.referer, notice: "L'article a été rajouté au panier" }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to request.referer, notice: 'Le panier a été mis à jour avec succès' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: "L'article a été retiré du panier" }
      format.json { head :no_content }
    end
  end

  def additem
    @qty = @cart.quantity
    if @qty < Variant.find(@cart.variant_id).stock
      @qty += 1
      @cart.update(quantity: @qty)
      respond_to do |format|
        format.html { redirect_to request.referer, notice: 'Le panier a été mis à jour avec succès' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referer, alert: "Le revendeur ne possède que #{Variant.find(@cart.variant_id).stock} exemplaire(s) de cet article en stock" }
        format.json { head :no_content }
      end
    end
  end

  def removeitem
    @qty = @cart.quantity - 1
    @cart.update(quantity: @qty)
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Le panier a été mis à jour avec succès' }
      format.json { head :no_content }
    end
  end

  def payment
    if params[:country].blank? then
      order_params = params.permit(:address, :zipcode)
    else
      order_params = params.permit(:address, :zipcode, :country)
    end

    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @carts = Cart.where(user_id: current_user.id).where(order_id: nil)
    @amount = ((@carts.map(&:total_per_item).instance_eval { reduce(:+) })*100).to_i


    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      #description renvoie a quel nom est cree le compte (details des payments visibles sur stripe directement, notament le nom)
      description: 'Rails Stripe customer',
      currency: 'EUR',
    })

    @order.stripe_id = params[:stripeToken]

    @order.save
    @carts.each do |item_in_cart|
        v = Variant.find(item_in_cart.variant_id)
        item_in_cart.update(order_id: @order.id)
        v.update(stock: v.stock - item_in_cart.quantity)
    end   

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :root
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:order_id, :variant_id, :user_id, :quantity)
    end
  
end