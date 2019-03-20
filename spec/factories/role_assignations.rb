FactoryBot.define do
  factory :role_assignation do
    user { FactoryBot.create(:user)}
    role { FactoryBot.create(:role) }
  end
end
