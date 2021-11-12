# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :puzzle_categories, dependent: nil
  has_many :puzzles, through: :puzzle_categories

  validates :name, presence: true
end
