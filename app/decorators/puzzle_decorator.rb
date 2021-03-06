# frozen_string_literal: true

class PuzzleDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user
  # decorates_association :solutions

  def show_image(css_class: '')
    h.image_tag image.url(:medium), class: "rounded #{css_class}"
  end

  def show_solved(user)
    solutions.where(user: user).order(created_at: :desc).first.solved
  end

  def show_category
    categories.order(created_at: :desc).limit(1)[0].name
  end

  def show_complexity
    puzzle_categories.order(created_at: :desc).limit(1)[0].complexity
  end

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
