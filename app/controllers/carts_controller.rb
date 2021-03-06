class CartsController < ApplicationController
  before_action :set_cart, only: [:update, :destroy, :additem, :removeitem]
  before_action :authenticate_user!

  def index
    @carts = Cart.where(user_id: current_user.id).where(order_id: nil).order(:id)
    @carts.empty? ? countCart = 0 : countCart = @carts.size 
    @amount = @carts.map(&:total_per_item).instance_eval { reduce(:+) }

    if @carts.empty?
      flash.now[:alert] = "Votre panier est vide"
    end
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id

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
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.require(:cart).permit(:order_id, :variant_id, :quantity)
    end
end