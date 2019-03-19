FactoryBot.define do
  factory :variant do
    title { "MyString" }
    item { FactoryBot.create(:item) }
    price { 1 }
    stock { 1 }
  end
end
