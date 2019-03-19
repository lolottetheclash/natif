FactoryBot.define do
  factory :post do
    title { "MyString zef" }
    content { "MyString jlhf zacofuybfuygabecfecfefxzfz" }
    author { FactoryBot.create(:user) }
    theme { FactoryBot.create(:theme)}
 
  end
end
