FactoryBot.define do
  factory :option_association do
    variant { FactoryBot.create(:variant) }
    option_value { FactoryBot.create(:option_value) }
  end
end
