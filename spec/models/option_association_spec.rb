require 'rails_helper'

RSpec.describe OptionAssociation, type: :model do
	 before(:each) do 
	 	@option_association = FactoryBot.create(:option_association)
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@option_association).to be_a(OptionAssociation)
	    end

	    describe "variant" do
	        it { expect(@option_association).to validate_presence_of(:variant) }
	    end

     	describe "option_value" do
        	it { expect(@option_association).to validate_presence_of(:option_value) }
      	end
	end
end
