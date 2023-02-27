# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


20.times do
  title = Faker::Book.title
  author = Faker::Book.author
  condition_book = rand(1..3)
  status_book = rand(1..3)
  description = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  Book.create title: title, author: author, description: description, condition_book: condition_book, status_book: status_book
end
