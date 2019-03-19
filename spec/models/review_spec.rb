require 'rails_helper'

RSpec.describe Review, type: :model do
	before(:each) do 
		@review = FactoryBot.create(:review)
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@review).to be_a(Review)
	    end

	    describe "title" do
	      it { expect(@review).to validate_presence_of(:title) }
	    end

	    describe "content" do
	      it { expect(@review).to validate_presence_of(:content) }
	    end

	    describe "rating" do
	      it { expect(@review).to validate_presence_of(:rating) }
	    end

	    it "should return an integer" do
      	  expect(@review.rating).to be_a(Integer)
     	end

	    it "should be less than 6" do
	    	validate_numericality_of(:rating).is_less_than(6)
	     end

	    it "should be greater than 0" do
	    	validate_numericality_of(:rating).is_greater_than(0)
	  	end

	    describe "title" do
	      it { expect(@review).to validate_length_of(:title).is_at_least(2) }
	    end

	    describe "title" do
	      it { expect(@review).to validate_length_of(:title).is_at_most(20) }
	    end

	    it "should return a string" do
        	expect(@review.title).to be_a(String)
     	end

	    describe "content" do
	      it { expect(@review).to validate_length_of(:content).is_at_least(20) }
	    end

	    describe "content" do
	      it { expect(@review).to validate_length_of(:content).is_at_most(80) }
	    end

	    it "should return a string" do
        	expect(@review.content).to be_a(String)
     	end
	end  
end