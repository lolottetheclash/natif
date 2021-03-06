require 'rails_helper'

RSpec.describe "carts/edit", type: :view do
  before(:each) do
    @cart = assign(:cart, Cart.create!(
      :order => nil,
      :variant => nil,
      :user => nil,
      :quantity => 1
    ))
  end

  it "renders the edit cart form" do
    render

    assert_select "form[action=?][method=?]", cart_path(@cart), "post" do

      assert_select "input[name=?]", "cart[order_id]"

      assert_select "input[name=?]", "cart[variant_id]"

      assert_select "input[name=?]", "cart[user_id]"

      assert_select "input[name=?]", "cart[quantity]"
    end
  end
end
