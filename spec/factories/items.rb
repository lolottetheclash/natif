FactoryBot.define do
  factory :item do
    title { "MyString" }
    description { "MyTextijsdhfuzeh ozeuf!zueyfeuzy" }
    category { FactoryBot.create(:category) }
    author { FactoryBot.create(:user) }
  end
end
