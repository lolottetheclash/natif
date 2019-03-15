class CartsController < ApplicationController
  #before_action :set_cart, only: [:show, :edit, :update, :destroy, :additem, :removeitem]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.where(user_id: 1)#.where(user_id: current_user.id).where(order_id: nil)
    if @carts.empty?
      flash.now[:alert] = "Your book was not found"
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
    #@user =current_user.id
    #@cart.user_id  = current_user.id

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
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
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
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
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def additem
    @qty = @cart.quantity + 1
    @cart.update(quantity: @qty)
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Cart was successfuuuuuully saved.' }
      format.json { head :no_content }
    end
  end

  def removeitem
    @qty = @cart.quantity - 1
    @cart.update(quantity: @qty)
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Cart was successfuuuuuully saved.' }
      format.json { head :no_content }
    end
  end

  def payment
    @order = Order.new
    @amount = 0
    @carts = Cart.where(user_id: 1)#.where(user_id: current_user.id).where(order_id: nil)
    i = 0

    @carts.each do |item_in_cart|
      i +=1
      @amount += item_in_cart.total_per_item
    end

    # En centimes
    @amount *= 100
    @amount = @amount.to_i

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
    @order.address = "4 rue de la colombe endiablée"
    @order.zipcode = "31000"
    @order.delivery_id = 2
    @order.user_id = current_user.id

    @order.save
    @carts.each do |item_in_cart|
        item_in_cart.update(order_id: @order.id)
        Variant.find(item_in_cart.variant_id).stock -= item_in_cart.quantity
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
