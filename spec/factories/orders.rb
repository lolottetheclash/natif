FactoryBot.define do
  factory :order do
    stripe_id { "MyString" }
    address { "MyString" }
    zipcode { "MyString" }
    user { nil }
    delivery { nil }
  end
end
