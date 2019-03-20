require 'rails_helper'

RSpec.describe Wishlist, type: :model do
	before(:each) do 
	 @wishlist = FactoryBot.create(:wishlist)
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@wishlist).to be_a(Wishlist)
	    end


	    describe "variant" do
	        it { expect(@wishlist).to validate_presence_of(:variant) }
	    end

     	describe "user" do
        	it { expect(@wishlist).to validate_presence_of(:user) }
      	end
	end
end
