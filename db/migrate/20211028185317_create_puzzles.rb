class CreatePuzzles < ActiveRecord::Migration[6.1]
  def change
    create_table :puzzles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :solution, null: false
      t.belongs_to :user, null: false, foreign_key: true
      
      t.timestamps
    end

    add_index :puzzles, [:user_id, :puzzle_id], unique: true
  end
end
