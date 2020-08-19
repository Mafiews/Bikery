# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts 'Destroying...'
Bike.destroy_all
User.destroy_all

puts 'Loading...'

user = User.create(
  email: "test@test.com",
  password: "test12345",
  first_name: "Yizhu",
  last_name: Faker::Name.last_name,
  address: "14 rue Crespin du Gast, 75011 Paris",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

image0 = URI.open("https://avatars1.githubusercontent.com/u/60975663?s=460&u=0fa7727e6fb40e7f9567fadcb43f2b7452d87c91&v=4")
user.photo.attach(io: image0, filename: "user#{user.id}.jpg", content_type: "image/png")

user1 = User.create(
  email: "test2@test.com",
  password: "test12345",
  first_name: "Ilana",
  last_name: Faker::Name.last_name,
  address: "117 Faubourg Saint Honoré, 75008 Paris",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

image1 = URI.open("https://avatars3.githubusercontent.com/u/64773479?v=4")
user1.photo.attach(io: image1, filename: "user#{user1.id}.png", content_type: "image/png")

user2 = User.create(
  email: "test3@test.com",
  password: "test12345",
  first_name: "Matthieu",
  last_name: Faker::Name.last_name,
  address: "91 Place de la Madeleine, 75008 Paris",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

image2 = URI.open("https://avatars0.githubusercontent.com/u/62572114?v=4")
user2.photo.attach(io: image2, filename: "user#{user2.id}.png", content_type: "image/png")

user3 = User.create(
  email: Faker::Internet.email,
  password: Faker::Beer.brand,
  first_name: "Kally",
  last_name: Faker::Name.last_name,
  address: "91 Place de la Madeleine, 75008 Paris",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code
)

image3 = URI.open("https://avatars1.githubusercontent.com/u/66737679?v=4")
user3.photo.attach(io: image3, filename: "user#{user3.id}.png", content_type: "image/png")




bike = Bike.new(
  model: "Marty McFly",
  bike_type: "flying",
  condition: "new",
  price: 49,
  description: Faker::Quote.matz,
  address: "16 Villa Gaudelet, Paris 75011"
  )
bike.user = user1
bike.save!
img = URI.open("https://www.fictiontofact.com/files/media/52162/et.png")
bike.photo.attach(io: img, filename: "bike#{bike.id}.png", content_type: "image/png")

bike1 = Bike.new(
  model: Faker::Movies::BackToTheFuture.character,
  bike_type: "electric",
  condition: "new",
  price: 40,
  description: Faker::Quote.matz,
  address: "14 rue Crespin du Gast, 75011 Paris"
  )
bike1.user = user1
bike1.save!
img1 = URI.open("https://elite-motor.com/pub/media/catalog/product/cache/c687aa7517cf01e65c009f6943c2b1e9/n/k/nk.jpg")
bike1.photo.attach(io: img1, filename: "bike#{bike1.id}.jpg", content_type: "image/png")

bike2 = Bike.new(
  model: Faker::Movies::BackToTheFuture.character,
  bike_type: "monocycle",
  condition: "good",
  price: 45,
  description: Faker::Quote.matz,
  address: "38 Rue Saint-Maur, 75011 Paris"
  )
bike2.user = user2
bike2.save!
img2 = URI.open("https://4.bp.blogspot.com/-_t3a2SFoB_0/UnpgPiQDrWI/AAAAAAAAAbI/llFEU57zzVQ/s1600/tom+anable+anables+atom.JPG")
bike2.photo.attach(io: img2, filename: "bike#{bike2.id}.jpg", content_type: "image/png")

bike3 = Bike.new(
  model: Faker::Movies::BackToTheFuture.character,
  bike_type: "tandem",
  condition: "good",
  price: 30,
  description: Faker::Quote.matz,
  address: "107 Boulevard Richard-Lenoir, 75011 Paris"
  )
bike3.user = user2
bike3.save!
img3 = URI.open("https://cdn.shopify.com/s/files/1/0019/7073/3109/collections/Tandem-bike-rental_1200x1200.jpg")
bike3.photo.attach(io: img3, filename: "bike#{bike3.id}.jpg", content_type: "image/png")

bike4 = Bike.new(
  model: Faker::Movies::BackToTheFuture.character,
  bike_type: "folding",
  condition: "good",
  price: 25,
  description: Faker::Quote.matz,
  address: "6 Rue Etienne Dolet, 75020 Paris"
  )
bike4.user = user2
bike4.save!
img4 = URI.open("https://www.neozone.org/blog/wp-content/uploads/2020/05/xiaomi-velo-electrique-002.jpg")
bike4.photo.attach(io: img4, filename: "bike#{bike4.id}.jpg", content_type: "image/png")


# user seeds without photo
# 10.times do
#   User.create(
#     email: Faker::Internet.email,
#     password: Faker::Beer.brand,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     address: Faker::Address.full_address,
#     phone_number: Faker::PhoneNumber.phone_number_with_country_code
#   )
# end

# bike seeds without photo
# 10.times do
#   bike = Bike.new(
#     model: Faker::Movies::BackToTheFuture.character,
#     bike_type: ["electric", "flying", "monocycle", "tandem", "folding", "race", "city", "cargo"].sample,
#     condition: ["fair", "good", "new"].sample,
#     price: [15, 20, 25, 30, 35, 49].sample,
#     description: Faker::Quote.matz
#   )
#   bike.user_id = (1..10).to_a.sample
#   bike.save!
# end



