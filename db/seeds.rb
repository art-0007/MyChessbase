# frozen_string_literal: true

@category1 = Category.create name: 'OPENING'
@category2 = Category.create name: 'MIDDLEGAME'
@category3 = Category.create name: 'ENDGAME'

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

20.times do
  email = "#{SecureRandom.hex(7)}@gmail.com"
  name = Faker::Name.first_name
  password = 'test'
  title = Faker::Hipster.sentence(word_count: 2)
  body = Faker::Lorem.paragraph(sentence_count: 8, supplemental: true, random_sentences_to_add: 4)
  user = User.create name: name, email: email, password: password
  Article.create title: title, body: body, user: user
end


User.create(name: 'Alex', email: 'alex01@gmail.com', password: 'test007', role: 2)
User.create(name: 'Mark', email: 'mark01@gmail.com', password: 'test007', role: 1)

# 30.times do
#   title = Faker::Hipster.word
#   Tag.create title: title
# end
