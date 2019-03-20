FactoryBot.define do
  factory :wishlist do
    user { FactoryBot.create(:user) }
    variant { FactoryBot.create(:variant) }
  end
end
