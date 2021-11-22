# **My Chessbase**

## Description
This is a small application for chess lovers. Here you can create puzzles, solve, adds interesting articles about chess strategy and theory. You can also comment on all submitted materials, view the comments of other participants. The application has added a convenient search mechanism through the use and combination of different types of sorting, tags, and categories.

## The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.1](https://github.com/art-0007/MyChessbase/blob/main/Gemfile#L6)
- Rails [6.1.4](https://github.com/art-0007/MyChessbase/blob/main/Gemfile#L9)


## Database Associations
Users Has Many Puzzles Has Many Solutions Has Many Articles

Puzzles Belongs to User Has Many Solutions Has Many Puzzle_categories Has Many Categories Through Puzzle_categories

Solutions Belongs to User Belongs to User Puzzle

Tag Has Many Article_tags Has Many Articles Through Article_tags

Puzzle_category Belongs to Puzzle Belongs to Category

Comment Belongs to Commentable, polymorphic: true Belongs to User

Category Has Many Puzzle_categories Has Many Puzzles Through Puzzle_categories

Article Belongs to User Has Many Article_tags Has Many Tags Through Article_tags

Article_tag Belongs to Article Belongs to Tag

## Installation Instructions

git clone

bundle install

rake db:migrate

Run rake db:seed

rails s

And now you can visit the site with the URL http://localhost:3000

## How to use Program

Sign up, login if you already have an account, or login/sign up with your facebook login

Click Puzzles
Click Create Puzzle for create your own puzzle
Click Show for solve the puzzle

Click Articles
Click Create Article for create your own puzzle
Click Show for read the article


## Contributions
Bug reports and pull requests are welcome on GitHub. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License
The repo is available as open source under the terms of the MIT License.

