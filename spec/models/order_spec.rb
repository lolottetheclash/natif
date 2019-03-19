require 'rails_helper'

RSpec.describe Order, type: :model do

	before(:each) do 
	 @order = FactoryBot.create(:order)

	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@order).to be_a(Order)
	    end

	    describe "address" do
	      it { expect(@order).to validate_presence_of(:address) }
	    end

	    it "should return a string" do
        expect(@order.address).to be_a(String)
     	end

		describe "zipcode" do
	      it { expect(@order).to validate_presence_of(:zipcode) }
	    end

	    it "should return a string" do
        expect(@order.zipcode).to be_a(String)
     	end


		describe "stripe_id" do
	      it { expect(@order).to validate_presence_of(:stripe_id) }
	    end

	    it "should return a string" do
        expect(@order.stripe_id).to be_a(String)
     	end


	    describe "#zipcode" do
      	it "should not be valid with specials characters " do
        bad_zip = Order.create(zipcode: "////++++")
        expect(bad_zip).not_to be_valid
        expect(bad_zip.errors.include?(:zipcode)).to eq(true)
      end

    end

	 	context "associations" do
			it { should have_many(:carts)}
	 	end
	end
end
