# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bundler'
Bundler.require


puts "\n"*2
puts "$" *60
puts "\nCreation of the profiles Guest, User, Blog_Manager, Product_Manager, Moderator, Sale_Manager, Stock_and_Export_Mangager & Super_Admin"
	Role.create(name: "Guest", description: "Person visiting the site without being authentificated. Read only rights apply to the Guest.")
	Role.create(name: "User", description: "Person connected to the site. They can buy items or create a wishlist. Leave comments & reviews.")
	Role.create(name: "Blog_Manager", description: "Person in charge of the creation of blog articles (creation, update, deletion).")
	Role.create(name: "Product_Manager", description: "Person in charge of the creation of items (creation, update, deletion).")
	Role.create(name: "Moderator", description: "Person in charge of controlling the contents of reviews, comments, posts & items. Can ban a user.")
	Role.create(name: "Sale_Manager", description: "Person monitoring sales statistics.")
	Role.create(name: "Stock_and_Export_Mangager", description: "Person monitoring deliveries of goods.")
	Role.create(name: "Super_Admin", description: "Can do anything... Pretty much a god.")
puts "\nSeed of table Role has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table User (20 Users)"
20.times do |i|
	User.create(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: Faker::Space.moon,
		age: rand(18..99),
		email: Faker::Internet.email,
		password: "aaaaaa"
		)
	RoleAssignation.create(user_id: i, role_id: 2)
	print "\r#{i+1} user created over 20"
end
puts "\nSeed of table User has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table User (with other profiles)"

puts "Blog_Manager: username = blog_manager // password = admin123 -- Successfully Created"
	User.create(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "blog_manager",
		age: rand(18..99),
		email: "blog_manager@gmail.com",
		password: "admin123"
		)
	RoleAssignation.create(user_id: 21, role_id: 3)

puts "Product_Manager: username = product_manager // password = admin123 -- Successfully Created"
	User.create(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "product_manager",
		age: rand(18..99),
		email: "product_manager@gmail.com",
		password: "admin123"
		)
	RoleAssignation.create(user_id: 22, role_id: 4)

puts "Moderator: username = moderator // password = admin123 -- Successfully Created"
	User.create(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "moderator",
		age: rand(18..99),
		email: "moderator@gmail.com",
		password: "admin123"
		)
	RoleAssignation.create(user_id: 23, role_id: 5)

puts "Sale_Manager: username = sale_manager // password = admin123 -- Successfully Created"
	User.create(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "sale_manager",
		age: rand(18..99),
		email: "sale_manager@gmail.com",
		password: "admin123"
		)
	RoleAssignation.create(user_id: 24, role_id: 6)

puts "Stock_and_Export_Mangager: username = stock_export_manager // password = admin123 -- Successfully Created"
	User.create(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "stock_export_manager",
		age: rand(18..99),
		email: "stock_export_manager@gmail.com",
		password: "admin123"
		)
	RoleAssignation.create(user_id: 25, role_id: 7)

puts "Super_Admin: username = super_admin // password = admin123 -- Successfully Created"
	User.create(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "super_admin",
		age: rand(18..99),
		email: "super_admin@gmail.com",
		password: "admin123"
		)
	RoleAssignation.create(user_id: 26, role_id: 8)

puts "\nCreation of one user per profile successfully performed"
puts "-" *60


puts "\n"*2
puts "$" *60
puts "\nSeed of table Tag (20 Tags)"
40.times do |i|
	Tag.create(name: Faker::Commerce.material)
	print "\r#{i+1} tags created over 20"
end
puts "\nSeed of table Tag has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Theme (5 Themes)"
5.times do |i|
	Theme.create(name: Faker::App.name)
	print "\r#{i+1} themes created over 5"
end
puts "\nSeed of table Theme has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Category (5 Categories)"
5.times do |i|
	Category.create(name: Faker::Beer.brand)
	print "\r#{i+1} categories created over 5"
end
puts "\nSeed of table Category has been successfully performed"
puts "-" *60

deliveryStatusArray = ["Sent", "Not delivered", "Lost", "Delivered"]
#Then you only need to add a status to the array
puts "\n"*2
puts "$" *60
puts "\nSeed of table Delivery (4 Delivery Status)"
deliveryStatusArray.each do |statusOfDelivery|
	Delivery.create(
		status: statusOfDelivery
		)
end
puts "Created #{deliveryStatusArray.length}"
puts "\nSeed of table Delivery has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Order (5 Past Orders)"
5.times do |i|
	Order.create(
		stripe_id: "StripeIdGoesHere",
		address: Faker::Address.full_address,
		zipcode: Faker::Address.zip_code,
		user: User.all.sample,
		delivery: Delivery.all.sample
		)
	print "\r#{i+1} Order created over 5"
end
puts "\nSeed of table Order has been successfully performed"
puts "-" *60

optionArray = ["Clothe Size"]
#Then you only need to add a status to the array
puts "\n"*2
puts "$" *60
puts "\nSeed of table Option"
optionArray.each do |optionseed|
	Option.create(
		name: optionseed
		)
end
puts "Created #{optionArray.length}"
puts "\nSeed of table Option has been successfully performed"
puts "-" *60

clothesTopSize = ["XS", "S", "M", "L", "XL", "XXL", "3Xl", "4XL"]
colorsClothes = ["Black", "Dove", "Dark Chocolate", "Milk Chocolate", "Sand", "Peacock", "Tiffany", "Blueberry", "French", "Rain", "Navy", "Plum", "Grape", "Lavender", "Perwinkle", "Merlot", "Scarlet", "Cherry", "lipstick", "Magnolia", "Rust", "Sunset", "Tangerine", "Melon", "Marigold", "Mimosa", "Lemon"]
perfumeBottle = ["50 ml", "80 ml", "150 ml", "250 ml", "300 ml", "350 ml"]
itemweight = ["50 gr", "100 gr", "250 gr", "500 gr", "1 kg", "2,5 kg", "5 kg"]
#Then you only need to add an option to the array
puts "\n"*2
puts "$" *60
puts "\nSeed of table OptionValue"
clothesTopSize.each do |optionvalueclothesize| #Liee a option plus haut
	OptionValue.create(
		name: optionvalueclothesize,
		option: Option.all.sample
		)
end
puts "Created #{clothesTopSize.length}"
puts "\nSeed of table OptionValue has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Item (100 Items)"
100.times do |i|
	Item.create(
		title: Faker::Book.title,
		description: Faker::Lorem.paragraph,
		user_id: User.find_by_id(RoleAssignation.where(role_id: 4).sample.user_id).id,
		category: Category.all.sample
		)
	print "\r#{i+1} items created over 100"
end
puts "\nSeed of table Item has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Review (50 Reviews)"
50.times do |i|
	Review.create(
		title: Faker::Book.title,
		content: Faker::Lorem.paragraph,
		rating: rand(0..5),
		user_id: User.find_by_id(RoleAssignation.where(role_id: 2).sample.user_id).id,
		item: Item.all.sample
		)
	print "\r#{i+1} reviews created over 50"
end
puts "\nSeed of table Review has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Post (100 Posts)"
100.times do |i|
	Post.create(
		title: Faker::Book.title,
		content: Faker::Lorem.paragraph,
		user_id: User.find_by_id(RoleAssignation.where(role_id: 3).sample.user_id).id,
		theme: Theme.all.sample
		)
	print "\r#{i+1} posts created over 100"
end
puts "\nSeed of table Post has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Comments (200 Comments)"
100.times do |i|
	Comment.create(
		title: Faker::Book.title,
		content: Faker::Lorem.paragraph,
		user_id: User.find_by_id(RoleAssignation.where(role_id: 2).sample.user_id).id,
		commentable: Post.all.sample
		)
	print "\r#{i+1} comments created over 200"
end
100.times do |i|
	Comment.create(
		title: Faker::Book.title,
		content: Faker::Lorem.paragraph,
		user_id: User.find_by_id(RoleAssignation.where(role_id: 2).sample.user_id).id,
		commentable: Comment.all.sample
		)
	print "\r#{i+101} comments created over 200"
end
puts "\nSeed of table Comments has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Like (200 Likes)"
200.times do |i|
	Like.create(
		user_id: User.find_by_id(RoleAssignation.where(role_id: 2).sample.user_id).id,
		post: Post.all.sample
		)
	print "\r#{i+1} likes created over 200"
end
puts "\nSeed of table Like has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Variant (200 Variants)"
200.times do |i|
	Variant.create(
		title: Faker::Book.title,
		price: Faker::Number.decimal(2),
		stock: rand(0..10),
		item: Item.all.sample
		)
	print "\r#{i+1} variants created over 200"
end
puts "\nSeed of table Variant has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Wishlist (50 Wishlists)"
50.times do |i|
	Wishlist.create(
		user_id: User.find_by_id(RoleAssignation.where(role_id: 2).sample.user_id).id,
		variant: Variant.all.sample
		)
	print "\r#{i+1} wishlists created over 50"
end
puts "\nSeed of table Wishlist has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table TagItem (60 TagItems)"
20.times do |i|
	TagItem.create(
		tag: Tag.all.sample,
		taggable: Item.all.sample
		)
	print "\r#{i+1} TagItem created over 60"
end
20.times do |i|
	TagItem.create(
		tag: Tag.all.sample,
		taggable: Post.all.sample
		)
	print "\r#{i+21} TagItem created over 60"
end
20.times do |i|
	TagItem.create(
		tag: Tag.all.sample,
		taggable: Variant.all.sample
		)
	print "\r#{i+41} TagItem created over 60"
end
puts "\nSeed of table TagItem has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Cart (200 carts)"
200.times do |i|
	Cart.create(
		quantity: rand(1..5),
		order: Order.all.sample,
		variant: Variant.all.sample,
		user_id: User.find_by_id(RoleAssignation.where(role_id: 2).sample.user_id).id
		)
	print "\r#{i+1} carts created over 200"
end
puts "\nSeed of table Cart has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table OptionAssociation (100 option_associations)"
100.times do |i|
	OptionAssociation.create(
		variant: Variant.all.sample,
		option_value: OptionValue.all.sample
		)
	print "\r#{i+1} option_associations created over 100"
end
puts "\nSeed of table OptionAssociation has been successfully performed"
puts "-" *60