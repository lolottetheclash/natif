require 'rails_helper'

RSpec.describe Item, type: :model do
	before(:each) do 
	 @item = FactoryBot.create(:item)
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@item).to be_a(Item)
	    end

	    describe "title" do
	      it { expect(@item).to validate_presence_of(:title) }
	    end
	     describe "description" do
	      it { expect(@item).to validate_presence_of(:description) }
	    end

	    describe "title" do
	      it { expect(@item).to validate_length_of(:title).is_at_least(2) }
	    end

	    describe "title" do
	      it { expect(@item).to validate_length_of(:title).is_at_most(30) }
	    end

	    it "should return a string" do
        expect(@item.title).to be_a(String)
     	end

	    describe "content" do
	      it { expect(@item).to validate_length_of(:description).is_at_least(20) }
	    end

	    describe "content" do
	      it { expect(@item).to validate_length_of(:description).is_at_most(200) }
	    end

	     it "should return a string" do
        expect(@item.description).to be_a(String)
     	end
 	end

	context "associations" do
		it { should have_many(:tags).through(:tag_items) }
		it { should have_many(:tag_items) }
		it { should have_many(:variants) }
		it { should have_many(:reviews) }

 	end

end
