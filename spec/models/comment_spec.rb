require 'rails_helper'

RSpec.describe Comment, type: :model do
	before(:each) do 
		@comment = FactoryBot.create(:comment)
	end

  	context "validation" do
		it "is valid with valid attributes" do
			expect(@comment).to be_a(Comment)
		end


		describe "title" do
		 	it { expect(@comment).to validate_presence_of(:title) }
		end

		describe "title" do
		  	it { expect(@comment).to validate_length_of(:title).is_at_least(2) }
		end

		describe "title" do
		 	it { expect(@comment).to validate_length_of(:title).is_at_most(20) }
		end

		it "should return a string" do
        	expect(@comment.title).to be_a(String)
     	end

		describe "content" do
		 	it { expect(@comment).to validate_presence_of(:content) }
		end

		describe "content" do
		  	it { expect(@comment).to validate_length_of(:content).is_at_least(20) }
		end

		describe "content" do
		 	it { expect(@comment).to validate_length_of(:content).is_at_most(150) }
		end

		it "should return a string" do
        	expect(@comment.content).to be_a(String)
     	end

	end

	context "associations" do
		it { should have_many(:comments)}
		it { should belong_to(:commentable) }
	end
end







