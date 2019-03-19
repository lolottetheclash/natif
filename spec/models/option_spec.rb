require 'rails_helper'

RSpec.describe Option, type: :model do

	before(:each) do 
	 @option = FactoryBot.create(:option)
	  	
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@option).to be_a(Option)
	    end

	    describe "name" do
	      it { expect(@option).to validate_presence_of(:name) }
	    end

	    describe "name" do
	      it { expect(@option).to validate_length_of(:name).is_at_least(2) }
	    end

	    describe "name" do
	      it { expect(@option).to validate_length_of(:name).is_at_most(20) }
	    end

	    it "should return a string" do
        expect(@option.name).to be_a(String)
     	end


 	end

	context "associations" do
		it { should have_many(:option_values)}
 	end
 end
