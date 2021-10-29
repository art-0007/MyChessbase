class CreateUserSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_solutions do |t|
      t.string :body, null: false
      t.boolean :solved, default: false, null: false 
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :pazzle, null: false, foreign_key: true
      

      t.timestamps
    end

    add_index :user_solutions, [:user_id, :pazzle_id], unique: true
    add_index :user_solutions, [:user_id, :pazzle_id, :solved], unique: true
  end
end
