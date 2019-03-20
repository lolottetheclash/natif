require 'rails_helper'

RSpec.describe Tag, type: :model do
 
	before(:each) do 
	 @tag = FactoryBot.create(:tag)
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@tag).to be_a(Tag)
	    end

	    describe "name" do
	      it { expect(@tag).to validate_presence_of(:name) }
	    end

	    describe "name" do
	      it { expect(@tag).to validate_length_of(:name).is_at_least(2) }
	    end

	    describe "name" do
	      it { expect(@tag).to validate_length_of(:name).is_at_most(20) }
	    end

	    it "should return a string" do
          expect(@tag.name).to be_a(String)
      	end
 	end

	context "associations" do
		it { should have_many(:tag_items)}

 	end
end


