# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :puzzle_tags, dependent: :destroy
  has_many :puzzles, through: :puzzle_tags
end
