require 'rails_helper'

RSpec.describe Post, type: :model do
 
	before(:each) do 
		@post = FactoryBot.create(:post)
	end

  	context "validation" do

	    it "is valid with valid attributes" do
	      expect(@post).to be_a(Post)
	    end

	    describe "title" do
	      it { expect(@post).to validate_presence_of(:title) }
	    end

	    describe "title" do
	      it { expect(@post).to validate_length_of(:title).is_at_least(2) }
	    end

 		describe "title" do
	      it { expect(@post).to validate_length_of(:title).is_at_most(50) }
	    end

	    it "should return a string" do
        expect(@post.title).to be_a(String)
     	end

	    describe "content" do
	      it { expect(@post).to validate_length_of(:content).is_at_least(20) }
	    end

	    describe "content" do
	      it { expect(@post).to validate_length_of(:content).is_at_most(2000) }
	    end

	    it "should return a string" do
        	expect(@post.content).to be_a(String)
     	end
 	end

	context "associations" do
		it { should have_many(:tags).through(:tag_items) }
		it { should have_many(:tag_items) }
		it { should have_many(:likes) }
		it { should have_many(:comments) }
 	end

end


	
