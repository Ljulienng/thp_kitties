# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  user = User.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      email: Faker::Internet.email,
                      password: "123456")
end

20.times do
  product = Product.create!(title: Faker::Creature::Cat.name,
                            price: rand(1..10),
                            description: "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                            image_url: Faker::LoremPixel.image("300x157", false, 'cats')
                            )
  # while product.description.length < 20
  #   product.crea
end

6.times do
  cart = Cart.create!(user_id: User.all.sample.id)
end

12.times do
  cart_products = CartProduct.create!(cart_id: Cart.all.sample.id, product_id: Product.all.sample.id)
end
