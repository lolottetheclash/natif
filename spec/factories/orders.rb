FactoryBot.define do
  factory :order do
    stripe_id { "MyS34672" }
    address { "31, zejfhoizehfezjfhzeuf" }
    zipcode { "31500" }
    user { FactoryBot.create(:user) }
    delivery { FactoryBot.create(:delivery) }
  end
end
