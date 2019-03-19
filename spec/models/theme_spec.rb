require 'rails_helper'

RSpec.describe Theme, type: :model do
 
	before(:each) do 
		@theme = FactoryBot.create(:theme)
	  	
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@theme).to be_a(Theme)
	    end

	    describe "name" do
	      it { expect(@theme).to validate_presence_of(:name) }
	    end

	    describe "name" do
	      it { expect(@theme).to validate_length_of(:name).is_at_least(2) }
	    end

	    describe "name" do
	      it { expect(@theme).to validate_length_of(:name).is_at_most(30) }
	    end

	    it "should return a string" do
          expect(@theme.name).to be_a(String)
      	end

 	end

	context "associations" do
		it { should have_many(:posts) } 		
 	end

end


