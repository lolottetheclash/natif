require 'rails_helper'

  RSpec.describe User, type: :model do
	  before(:each) do 
	  	@user = FactoryBot.create(:user)
	  end

  context "validation" do
    
      it "is valid with valid attributes" do
        expect(@user).to be_a(User)
      end

      describe "#firstname" do
        it { expect(@user).to validate_presence_of(:firstname) }
      end


      it "should return a string" do
          expect(@user.firstname).to be_a(String)
      end

      describe "#lastname" do
        it { expect(@user).to validate_presence_of(:lastname) }
      end


      it "should return a string" do
          expect(@user.lastname).to be_a(String)
      end

      describe "#username" do
        it { expect(@user).to validate_presence_of(:username) }
      end

      describe "#username" do
        it { expect(@user).to validate_length_of(:username).is_at_least(3) }
      end

      describe "email" do
        it { expect(@user).to validate_presence_of(:email) }
      end

      it "should not be valid if not a mail" do
        invalid_user = User.create(email:"uherfuyvuvu")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:email)).to eq(true)
      end

      it "should return a string" do
          expect(@user.email).to be_a(String)
      end

      it "should not be valid with a short password" do
        invalid_user = User.create(password:"hey")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:password)).to eq(true)
      end

      it "should return a string" do
          expect(@user.password).to be_a(String)
      end

    	it "should return a integer" do
          expect(@user.age).to be_a(Integer)
      end
  end

  context "public instance methods" do
      it "should return a string" do
        expect(@user.fullname).to be_a(String)
      end

      it "should return the full name" do
        @user = User.create(firstname: "John", lastname: "Doe")
        expect(@user.fullname).to eq("John Doe")
      end
  end

  context "associations" do
   
      it { should have_many(:orders) }
      it { should have_many(:reviews) }
      it { should have_many(:likes) }
      it { should have_many(:comments) }
      it { should have_many(:posted_articles) }
      it { should have_many(:role_assignations) }
      it { should have_many(:roles).through(:role_assignations) }
      it { should have_many(:carts) }
      it { should have_many(:wishlists) }
      it { should have_many(:variants).through(:wishlists) }



  end
end



