FactoryBot.define do
  factory :comment do
	title { "MyString" }  	
	content{ "MyString	zfah	zefuhz	eouygfuozegfoyze" }  	
    user { FactoryBot.create(:user) }
  	commentable { FactoryBot.create(:post) }
  end
end

