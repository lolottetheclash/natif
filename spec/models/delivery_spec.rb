require 'rails_helper'

RSpec.describe Delivery, type: :model do

	before(:each) do 
	 	@delivery = FactoryBot.create(:delivery)	
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@delivery).to be_a(Delivery)
	    end

	    describe "name" do
	      it { expect(@delivery).to validate_presence_of(:status) }
	    end

	    describe "name" do
	      it { expect(@delivery).to validate_length_of(:status).is_at_least(2) }
	    end

	    describe "name" do
	      it { expect(@delivery).to validate_length_of(:status).is_at_most(30) }
	    end

	    it "should return a string" do
       	 expect(@delivery.status).to be_a(String)
     	end
 	end

	context "associations" do
		it { should have_many(:orders)}
 	end

end



