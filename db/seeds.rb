require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(0..50).each do
  User.create!(name: Faker::Name.name, email: Faker::Internet.unique.email, uuid: Faker::Internet.unique.uuid, token: 'token')
end

(0..500).each do
  ranking = Ranking.find_or_initialize_by(month: Random.rand(1..12), year: Random.rand(2020..2023), user: User.all.sample)
  ranking.distance_traveled = Random.rand(1..9999)
  ranking.save!
end
