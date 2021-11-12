# frozen_string_literal: true

class CategoryDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user

  def set_category
    categories.order(created_at: :asc).limit(1)[0].name
  end

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
