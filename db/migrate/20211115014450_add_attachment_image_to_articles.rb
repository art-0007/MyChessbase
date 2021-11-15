# frozen_string_literal: true

class AddAttachmentImageToArticles < ActiveRecord::Migration[6.1]
  def self.up
    change_table :articles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :articles, :image
  end
end
