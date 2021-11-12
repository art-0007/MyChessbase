# frozen_string_literal: true

@category1 = Category.create name: 'EASY PUZZLES'
@category2 = Category.create name: 'HARD PUZZLES'
@category3 = Category.create name: 'MEDIUM PUZZLES'

10.times do
  email = "#{SecureRandom.hex(7)}@gmail.com"
  name = Faker::Name.first_name
  password = 'test'
  title = Faker::Hipster.sentence(word_count: 2)
  body = Faker::Lorem.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 4)
  solution = 'Puzzle test'
  user = User.create name: name, email: email, password: password
  puzzle = Puzzle.create title: title, body: body, solution: solution, user: user
  puzzle.categories << @category1
end

10.times do
  email = "#{SecureRandom.hex(7)}@gmail.com"
  name = Faker::Name.first_name
  password = 'test'
  title = Faker::Hipster.sentence(word_count: 2)
  body = Faker::Lorem.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 4)
  solution = 'Puzzle test'
  user = User.create name: name, email: email, password: password
  puzzle = Puzzle.create title: title, body: body, solution: solution, user: user
  puzzle.categories << @category2
end

10.times do
  email = "#{SecureRandom.hex(7)}@gmail.com"
  name = Faker::Name.first_name
  password = 'test'
  title = Faker::Hipster.sentence(word_count: 2)
  body = Faker::Lorem.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 4)
  solution = 'Puzzle test'
  user = User.create name: name, email: email, password: password
  puzzle = Puzzle.create title: title, body: body, solution: solution, user: user
  puzzle.categories << @category3
end
