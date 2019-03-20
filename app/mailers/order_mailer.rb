class OrderMailer < ApplicationMailer
  def confirm_cart(order)
  	@order = order
    @user = User.find_by_id(@order.user_id)
    @cart = Cart.where(user_id: @order.user_id).where(order_id: nil)
    @url = order_url(@order)
    mail(to:@user.email, subject: "Votre commande ORD#{@order.id}  chez Nativéa a été prise en compte") 
  end
end
