FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyText" }
    item { nil }
    user { nil }
    rating { 1 }
  end
end
