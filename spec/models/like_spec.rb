require 'rails_helper'

RSpec.describe Like, type: :model do
	before(:each) do 
		@like = FactoryBot.create(:like)
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@like).to be_a(Like)
	    end

	    describe "user" do
	        it { expect(@like).to validate_presence_of(:user) }
	    end

     	describe "post" do
        	it { expect(@like).to validate_presence_of(:post) }
      	end
	end





end
