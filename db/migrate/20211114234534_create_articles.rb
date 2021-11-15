# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.belongs_to :user, null: false, foreign_key: true
      # t.attachment :image

      t.timestamps
    end

    add_index :articles, %i[user_id puzzle_id]
  end
end
