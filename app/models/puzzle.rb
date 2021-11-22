# frozen_string_literal: true

class Puzzle < ApplicationRecord
  include Commentable
  include Authors

  belongs_to :user
  has_many :solutions, dependent: :destroy
  has_many :puzzle_categories, dependent: :destroy
  has_many :categories, through: :puzzle_categories

  scope :puzzles_sorted, -> { includes(:user).order(created_at: :desc) }
  scope :current_user_author_puzzles, ->(current_user) { where(user: current_user).order(created_at: :desc) }
  scope :puzzles_solved_by_user, -> { joins(:solutions).merge(Solution.solutions_solved) }

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
