# frozen_string_literal: true

class Category < ApplicationRecord

  has_many :puzzle_categories, dependent: :destroy
  has_many :puzzles, through: :puzzle_categories

  validates :name, presence: true
end
