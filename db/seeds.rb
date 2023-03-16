# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

# seeds users
20.times do
  User.create!(
    username: Faker::Internet.username,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    description: Faker::Lorem.paragraphs(number: 10, supplemental: true).join,
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.country_code}",
    tagline: Faker::Marketing.buzzwords,
    want_to_work: rand(0..1) == 1
  )
end

# # seeds jobs

20.times do
  Job.create!(
    title: Faker::Job.title,
    description: Faker::Lorem.paragraphs(number: 10, supplemental: true).join,
    budget: rand(100..10000),
    employer_id: rand(1..10),
    start_date: Date.today,
    end_date: Date.today + 3
  )
end

# seeds bids for jobs
Job.all.each do |job|
  3.times do
    Bid.create!(
      rate: rand(100..1000),
      freelancer_id: User.find(([1, 2, 3, 4, 5, 6, 7, 8, 9, 10] - [job.employer_id]).sample).id,
      job_id: job.id
    )
  end
end

User.each do |user|
  file = URI.open("https://source.unsplash.com/random")
  user.photo.attach(io: file, filename: "photo#{rand(1..100)}", content_type: "image/jpg")
  article.save
end
