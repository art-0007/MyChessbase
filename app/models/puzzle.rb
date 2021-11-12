# frozen_string_literal: true

class Puzzle < ApplicationRecord
  belongs_to :user
  has_many :solutions, dependent: :destroy
  has_many :puzzle_categories, dependent: nil
  has_many :categories, through: :puzzle_categories

  # validates :categories, presence: true

  has_attached_file :image, styles: { medium: '400x400#' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |_i, category_attributes|
      next if category_attributes[:name].blank?

      category = Category.find_or_create_by(name: category_attributes[:name])
      puzzle_categories.build(category: category) unless categories.include?(category)
    end
  end
end
