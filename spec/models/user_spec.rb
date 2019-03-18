require 'rails_helper'

RSpec.describe User, type: :model do
	  before(:each) do 
	  	@user = FactoryBot.create(:user)
	  end

  context "validation" do
  
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#first_name" do
      it { expect(@user).to validate_presence_of(:firstname) }
    end

    describe "#last_name" do
      it { expect(@user).to validate_presence_of(:lastname) }
    end

    describe "#username" do
      it { expect(@user).to validate_length_of(:username).is_at_least(3) }
    end


 	describe "mail" do
      it "should not be valid if not a mail" do
        invalid_user = User.create(email:"uherfuyvuvu")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:email)).to eq(true)
      end
    end

    describe "password" do
      it "should not be valid with a short password" do
        invalid_user = User.create(password:"hey")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:password)).to eq(true)
      end
    end

	describe "age" do
      it "should not be valid with a string" do
        invalid_user = User.create(age:"coucou")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:age)).to eq(true)
      end
    end

  end

context "public instance methods" do

    describe "#fullname" do
      it "should return a string" do
        expect(@user.fullname).to be_a(String)
      end

       it "should return the full name" do
        expect(@user.fullname).to eq("John Doe")
      end
    end
end

context "associations" do

    describe "role_assignations" do
       it {expect(@user).to have_many(:role_assignations)}
      end
  end
end



