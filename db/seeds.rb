# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  User.create!(
    username: Faker::Internet.username,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    description: Faker::Quote.famous_last_words,
    location: Faker::Address.full_address,
    tagline: Faker::Marketing.buzzwords
  )
end
