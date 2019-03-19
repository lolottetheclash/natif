require 'rails_helper'

RSpec.describe Cart, type: :model do

	before(:each) do 
		@cart = FactoryBot.create(:cart)
	end

	it "is valid with valid attributes" do
     	expect(@cart).to be_a(Cart)
    end

    describe "quantity" do
      	it { expect(@cart).to validate_presence_of(:quantity) }
    end

    it "should return an integer" do
      	expect(@cart.quantity).to be_a(Integer)
    end

    it "should be greater than 0" do
    	validate_numericality_of(:rating).is_greater_than(0)
  	end

	describe "quantity" do
     	it "should not be valid with negative" do
	     	bad_cart = Cart.create(quantity: -1)
		  	expect(bad_cart).not_to be_valid
		  	expect(bad_cart.errors.include?(:quantity)).to eq(true)
	  	end
    end

    describe "quantity" do
     	it "should not be valid with float" do
	     	bad_cart = Cart.create(quantity: 0.98)
		    expect(bad_cart).not_to be_valid
		    expect(bad_cart.errors.include?(:quantity)).to eq(true)
    	end
    end
end






