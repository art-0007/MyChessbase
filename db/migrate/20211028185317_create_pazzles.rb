class CreatePazzles < ActiveRecord::Migration[6.1]
  def change
    create_table :pazzles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.belongs_to :author, :class_name => 'User', :foreign_key => 'author_id', null: false
      t.string :solution, null: false
      
      t.timestamps
    end

    add_index :pazzles, [:author_id, :pazzle_id], unique: true
  end
end
