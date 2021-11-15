# frozen_string_literal: true

class CreatePuzzleTags < ActiveRecord::Migration[6.1]
  def change
    create_table :puzzle_tags do |t|
      t.belongs_to :puzzle, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :puzzle_tags, %i[puzzle_id tag_id], unique: true
  end
end
