class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:destroy]
  before_action :authenticate_user!
  
  def index
    @wishlists = Wishlist.where(user_id:current_user.id)
    @user = User.find(current_user.id)
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.user_id = current_user.id

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to request.referer, notice: "L'article a été rajouté à la wishlist" }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to wishlists_url, notice: 'Le produit a été retiré de la Wishlist.' }
      format.json { head :no_content }
    end
  end

  private
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end
    def set_cart
      @cart = Cart.find(params[:id])
    end
    def wishlist_params
      params.require(:wishlist).permit(:variant_id)
    end
end
