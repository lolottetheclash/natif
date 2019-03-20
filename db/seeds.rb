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
puts "\nSeed of table User (with other profiles)"

puts "Blog_Manager: username = blog_manager // password = admin123 -- Successfully Created"
	user = User.new(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "blog_manager",
		age: rand(18..99),
		email: "blog_manager@gmail.com",
		password: "admin123"
		)
	user.skip_confirmation!
  user.save!
	RoleAssignation.create(user_id: 1, role_id: 3)

puts "Product_Manager: username = product_manager // password = admin123 -- Successfully Created"
	user = User.new(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "product_manager",
		age: rand(18..99),
		email: "product_manager@gmail.com",
		password: "admin123"
		)
	user.skip_confirmation!
  user.save!
	RoleAssignation.create(user_id: 2, role_id: 4)

puts "Moderator: username = moderator // password = admin123 -- Successfully Created"
	user = User.new(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "moderator",
		age: rand(18..99),
		email: "moderator@gmail.com",
		password: "admin123"
		)
	user.skip_confirmation!
  user.save!
	RoleAssignation.create(user_id: 3, role_id: 5)

puts "Sale_Manager: username = sale_manager // password = admin123 -- Successfully Created"
	user = User.new(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "sale_manager",
		age: rand(18..99),
		email: "sale_manager@gmail.com",
		password: "admin123"
		)
	user.skip_confirmation!
  user.save!
	RoleAssignation.create(user_id: 4, role_id: 6)

puts "Stock_and_Export_Mangager: username = stock_export_manager // password = admin123 -- Successfully Created"
	user = User.new(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "stock_export_manager",
		age: rand(18..99),
		email: "stock_export_manager@gmail.com",
		password: "admin123"
		)
	user.skip_confirmation!
  user.save!
	RoleAssignation.create(user_id: 5, role_id: 7)

puts "Super_Admin: username = super_admin // password = admin123 -- Successfully Created"
	user = User.new(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "super_admin",
		age: rand(18..99),
		email: "super_admin@gmail.com",
		password: "admin123"
		)
	user.skip_confirmation!
  user.save!
	RoleAssignation.create(user_id: 6, role_id: 8)

puts "\nCreation of one user per profile successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table User (1 users)"
	user = User.new(
		gender: Faker::Gender.binary_type,
		firstname: Faker::Name.first_name,
		lastname: Faker::Name.last_name,
		username: "user",
		age: rand(18..99),
		email: "user@gmail.com",
		password: "aaaaaa"
		)
	user.skip_confirmation!
  user.save!
	RoleAssignation.create(user_id: 7, role_id: 2)
	print "\r 1 user created over"

puts "\nSeed of table User has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Tag (40 Tags)"
40.times do |i|
	Tag.create(name: Faker::Commerce.material)
	print "\r#{i+1} tags created over 40"
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

deliveryStatusArray = ["Not delivered", "Sent", "Lost", "Delivered"]
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
		user_id: User.find_by_id(RoleAssignation.where(role_id: 2).sample.user_id).id,
		delivery: Delivery.all.sample
		)
	print "\r#{i+1} Order created over 5"
end
puts "\nSeed of table Order has been successfully performed"
puts "-" *60

optionArray = ["Size", "Color", "Litre", "Weight"]
#Then you only need to add a status to the array
puts "\n"*2
puts "$" *60
puts "\nSeed of table Option"
optionArray.each do |option|
	Option.create(
		name: option
		)
end
puts "Created #{optionArray.length}"
puts "\nSeed of table Option has been successfully performed"
puts "-" *60

optionvalueArray = [["XS", "S", "M", "L", "XL", "XXL", "3Xl", "4XL"], ["Black", "Dove", "Dark Chocolate", "Milk Chocolate", "Sand", "Peacock", "Tiffany", "Blueberry", "French", "Rain", "Navy", "Plum", "Grape", "Lavender", "Perwinkle", "Merlot", "Scarlet", "Cherry", "lipstick", "Magnolia", "Rust", "Sunset", "Tangerine", "Melon", "Marigold", "Mimosa", "Lemon"], ["50 ml", "80 ml", "150 ml", "250 ml", "300 ml", "350 ml"], ["50 gr", "100 gr", "250 gr", "500 gr", "1 kg", "2,5 kg", "5 kg"]]
#Then you only need to add an option to the array
puts "\n"*2
puts "$" *60
puts "\nSeed of table OptionValue"
$index = 1
$count = 1
optionvalueArray.each do |element| #Liee a option plus haut
	element.each do |value|
		OptionValue.create(
			name: value,
			option: Option.find($index)
			)
	end
	$index +=1
end
puts "\nSeed of table OptionValue has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Item (100 Items)"
100.times do |i|
	Item.create(
		title: Faker::Book.title,
		description: Faker::Lorem.paragraph,
		author: User.find_by_id(2),
		category: Category.all.sample
		)
	print "\r#{i+1} items created over 100"
end
puts "\nSeed of table Item has been successfully performed"
puts "-" *60

puts "\n"*2
puts "$" *60
puts "\nSeed of table Review (300 Reviews)"
300.times do |i|
	Review.create(
		title: Faker::Book.title,
		content: Faker::Lorem.paragraph,
		rating: rand(0..5),
		user_id: User.find_by_id(RoleAssignation.where(role_id: 2).sample.user_id).id,
		item: Item.all.sample
		)
	print "\r#{i+1} reviews created over 300"
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
		author: User.find_by_id(1),
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
puts "\nSeed of table OptionAssociation (500 option_associations)"
500.times do |i|
	OptionAssociation.create(
		variant: Variant.all.sample,
		option_value: OptionValue.all.sample
		)
	print "\r#{i+1} option_associations created over 500"
end
puts "\nSeed of table OptionAssociation has been successfully performed"
puts "-" *60