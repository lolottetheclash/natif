FactoryBot.define do
  factory :user do
    firstname { Faker::Artist.name }
    lastname { Faker::FunnyName.name }
    username { Faker::Lorem.characters(10) }   
    age { 30 }
    email {Faker::Internet.email} 
    password {"tiptop31"}
    gender {"Female"}
  end
end