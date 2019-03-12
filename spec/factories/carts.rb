FactoryBot.define do
  factory :cart do
    order { nil }
    variant { nil }
    user { nil }
    quantity { 1 }
  end
end
