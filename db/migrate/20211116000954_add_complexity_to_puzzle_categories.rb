# frozen_string_literal: true

class AddComplexityToPuzzleCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :puzzle_categories, :complexity, :integer, default: 0, null: false
    add_index :puzzle_categories, :complexity
  end
end
