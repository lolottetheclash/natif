FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyTextzefzefzefzef zefzefze !!!!" }
    item { FactoryBot.create(:item) }
    user { FactoryBot.create(:user) }
    rating { 1 }
  end
end
