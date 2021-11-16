# frozen_string_literal: true

class PuzzleCategory < ApplicationRecord
  enum complexity: { EASY: 0, MEDIUM: 1, HARD: 2 }, _suffix: :complexity

  belongs_to :puzzle
  belongs_to :category
end
