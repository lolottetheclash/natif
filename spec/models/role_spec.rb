require 'rails_helper'

RSpec.describe Role, type: :model do

	  before(:each) do 
	  	@role = FactoryBot.create(:role)
	  	
	  end

  context "validation" do

      it "is valid with valid attributes" do
        expect(@role).to be_a(Role)
      end

      describe "name" do
        it { expect(@role).to validate_presence_of(:name) }
      end

      describe "name" do
        it { expect(@role).to validate_length_of(:name).is_at_least(2) }
      end
      
      describe "description" do
        it { expect(@role).to validate_presence_of(:description) }
      end
      describe "description" do
        it { expect(@role).to validate_length_of(:description).is_at_least(20) }
      end

  end

  context "associations" do

    describe "role_assignations" do
       it {expect(@role).to have_many(:role_assignations)}
      end
  end





end
