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

      it "should return a string" do
          expect(@role.name).to be_a(String)
      end

      describe "name" do
        it { expect(@role).to validate_length_of(:name).is_at_least(2) }
      end

      describe "name" do
        it { expect(@role).to validate_length_of(:name).is_at_most(30) }
      end
      
      describe "description" do
        it { expect(@role).to validate_presence_of(:description) }
      end

      it "should return a string" do
          expect(@role.description).to be_a(String)
      end

      describe "description" do
        it { expect(@role).to validate_length_of(:description).is_at_least(20) }
      end

       describe "name" do
        it { expect(@role).to validate_length_of(:description).is_at_most(150) }
      end

  end

  context "associations" do
      it { should have_many(:role_assignations) }
      it { should have_many(:users).through(:role_assignations) }
  end
end
