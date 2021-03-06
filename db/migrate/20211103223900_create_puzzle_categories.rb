# frozen_string_literal: true

class CreatePuzzleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :puzzle_categories do |t|
      t.belongs_to :puzzle, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
