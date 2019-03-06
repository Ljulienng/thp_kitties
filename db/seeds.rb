# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Product.destroy_all

10.times do
  user = User.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      email: Faker::Internet.email,
                      password: "123456")
end
i = 0
20.times do
  i += 1
  product = Product.create!(title: Faker::Creature::Cat.unique.name,
                            price: rand(1..10),
                            description: "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD",
                            image_url: Faker::LoremPixel.image("300x157", false, 'cats')
                            )
    product.avatar.attach(io: File.open("app/assets/images/img/Kittens/kitten#{i}.jpg"), filename:"kitten#{i}.jpg")
    while product.description.length < 15
      product.description = Faker::TvShows::RickAndMorty.quote
    end
end
