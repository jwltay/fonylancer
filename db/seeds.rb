# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seeds users
10.times do
  User.create!(
    username: Faker::Internet.username,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    description: Faker::Quote.famous_last_words,
    location: Faker::Address.full_address,
    tagline: Faker::Marketing.buzzwords,
    want_to_work: rand(0..1) == 1
  )
end

# seeds jobs

5.times do
  Job.create!(
    title: Faker::Job.title,
    description: Faker::Lorem.sentence,
    budget: rand(100..10000),
    employer_id: rand(1..10),
    start_date: Date.today,
    end_date: Date.today + 3
  )
end
