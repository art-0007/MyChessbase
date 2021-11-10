class Category < ApplicationRecord
    has_many :puzzle_categories
    has_many :puzzles, through: :puzzle_categories

    validates :name, presence: true
end
