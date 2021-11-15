class AddAttachmentImageToPuzzles < ActiveRecord::Migration[6.1]
  def self.up
    change_table :puzzles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :puzzles, :image
  end
end
