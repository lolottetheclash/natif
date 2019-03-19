require 'rails_helper'

RSpec.describe TagItem, type: :model do
	before(:each) do 
	 @tag_item = FactoryBot.create(:tag_item)
	end

  	context "validation" do
	    it "is valid with valid attributes" do
	      expect(@tag_item).to be_a(TagItem)
	    end
	end

	context "associations" do
		it { should belong_to(:taggable) }
	end
	
end