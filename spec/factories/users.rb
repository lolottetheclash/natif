FactoryBot.define do
  factory :user do
    firstname { "John" }
    lastname { "Doe" }
    username { "johndoe" }   
    age { 30 }
    email {"laurenzolivier@gmail.com"} 
    password {"tiptop31"}
    gender {"Female"}
  end
end