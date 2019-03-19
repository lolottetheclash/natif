require 'rails_helper'

RSpec.describe OptionValue, type: :model do

	before(:each) do 
	 @option_value = FactoryBot.create(:option_value)
	  	
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@option_value).to be_a(OptionValue)
	    end

	    describe "name" do
	      it { expect(@option_value).to validate_presence_of(:name) }
	    end

	    describe "name" do
	      it { expect(@option_value).to validate_length_of(:name).is_at_least(2) }
	    end

	    describe "name" do
	      it { expect(@option_value).to validate_length_of(:name).is_at_most(20) }
	    end

	    it "should return a string" do
        expect(@option_value.name).to be_a(String)
     	end


 	end

	context "associations" do
		it { should have_many(:option_associations)}

 	end

  	end