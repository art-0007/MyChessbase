# frozen_string_literal: true

class Puzzle < ApplicationRecord
  include Commentable

  belongs_to :user
  has_many :solutions, dependent: :destroy
  has_many :puzzle_categories, dependent: nil
  has_many :categories, through: :puzzle_categories
  # has_many :puzzle_tags, dependent: :destroy
  # has_many :tags, through: :puzzle_tags

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

  scope :all_by_tags, ->(tags) do
    questions = includes(:user)
    if tags
      questions = questions.joins(:tags).where(tags: tags).preload(:tags)
    else
      questions = questions.includes(:question_tags, :tags)
    end
     
    questions.order(created_at: :desc)
  end

end
