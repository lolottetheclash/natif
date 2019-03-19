FactoryBot.define do
  factory :cart do
    order { FactoryBot.create(:order) }
    variant { FactoryBot.create(:variant) }
    user { FactoryBot.create(:user) }
    quantity { 15 }
  end
end
