require 'rails_helper'

RSpec.describe Variant, type: :model do
	before(:each) do 
	 @variant = FactoryBot.create(:variant)

	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@variant).to be_a(Variant)
	    end

	    describe "title" do
	      it { expect(@variant).to validate_presence_of(:title) }
	    end

	    describe "title" do
	      it { expect(@variant).to validate_length_of(:title).is_at_least(2) }
	    end

	    describe "title" do
	      it { expect(@variant).to validate_length_of(:title).is_at_most(30) }
	    end

	    it "should return a string" do
        	expect(@variant.title).to be_a(String)
     	end

 		describe "price" do
	      it { expect(@variant).to validate_presence_of(:price) }
	    end

     	describe "stock" do
	      it { expect(@variant).to validate_presence_of(:stock) }
	    end

	   	it "should return an integer" do
      	  expect(@variant.stock).to be_a(Integer)
     	end

 	end

 	context "associations" do
		

		it { should have_many(:option_associations)}
		it { should have_many(:option_values).through(:option_associations) }

		it { should have_many(:carts)}
		it { should have_many(:users).through(:carts) }

		it { should have_many(:tag_items)}
		it { should have_many(:tags).through(:tag_items) }
 	end
end



  
 