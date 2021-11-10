class PuzzleCategory < ApplicationRecord
    belongs_to :puzzle
    belongs_to :category
end
