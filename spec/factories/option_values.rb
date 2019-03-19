FactoryBot.define do
  factory :option_value do
    name { "MyString" }
    option { FactoryBot.create(:option) }
  end
end
