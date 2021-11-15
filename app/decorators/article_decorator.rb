# frozen_string_literal: true

class ArticleDecorator < ApplicationDecorator
    delegate_all
    decorates_association :user
  
    def show_img(css_class: '')
      h.image_tag image.url(:medium), class: "rounded #{css_class}"
    end
  
    def formatted_created_at
      created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
  end