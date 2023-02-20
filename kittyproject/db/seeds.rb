# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
    Cat.create(
      birth_date: Faker::Date.between(from: '2010-01-01', to: '2021-02-18'),
      color: CAT_COLOR.sample,
      name: Faker::Creature::Cat.name,
      sex: ['M', 'F'].sample,
      description: Faker::Lorem.paragraph
    )
end