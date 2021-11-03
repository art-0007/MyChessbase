class CreateSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :solutions do |t|
      t.string :body
      t.boolean :solved, default: false
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :puzzle, null: false, foreign_key: true
      

      t.timestamps
    end

    add_index :solutions, [:user_id, :puzzle_id], unique: true
    add_index :solutions, [:user_id, :puzzle_id, :solved], unique: true
  end
end
