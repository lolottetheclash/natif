FactoryBot.define do
  factory :tag_item do
  	tag { FactoryBot.create(:tag) }
  	taggable { FactoryBot.create(:post) }
  end
end
