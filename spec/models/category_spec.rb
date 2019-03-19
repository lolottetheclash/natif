require 'rails_helper'

RSpec.describe Category, type: :model do
 
	before(:each) do 
	 @category = FactoryBot.create(:category)
	  	
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@category).to be_a(Category)
	    end

	    describe "name" do
	      it { expect(@category).to validate_presence_of(:name) }
	    end

	    describe "name" do
	      it { expect(@category).to validate_length_of(:name).is_at_least(2) }
	    end

	    describe "name" do
	      it { expect(@category).to validate_length_of(:name).is_at_most(20) }
	    end

		it "should return a string" do
        	expect(@category.name).to be_a(String)
     	end

 	end

	context "associations" do
		it { should have_many(:items)}
 	end

end


