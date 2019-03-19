require 'rails_helper'

RSpec.describe RoleAssignation, type: :model do

	before(:each) do 
	  	@role_assignation = FactoryBot.create(:role_assignation)
	end

	
  context "validation" do

      it "is valid with valid attributes" do
        expect(@role_assignation).to be_a(RoleAssignation)
      end

      describe "user" do
        it { expect(@role_assignation).to validate_presence_of(:user) }
      end

      describe "role" do
        it { expect(@role_assignation).to validate_presence_of(:role) }
      end
  end


end
