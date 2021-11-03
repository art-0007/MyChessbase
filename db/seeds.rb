30.times do
    email = Faker::Name.first_name + "@gmail.com"
    name = Faker::Name.first_name
    password = "test"
    title = Faker::Hipster.sentence(word_count: 2)
    body = Faker::Lorem.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 4)
    solution = Faker::Lorem.word
    current_user = User.create name: name, email: email, password: password
    Puzzle.create title: title, body: body, solution: solution, user: current_user
end
