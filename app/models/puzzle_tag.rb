# frozen_string_literal: true

class PuzzleTag < ApplicationRecord
  belongs_to :puzzle
  belongs_to :tag
end
