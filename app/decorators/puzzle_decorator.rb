class PuzzleDecorator < ApplicationDecorator
    delegate_all
    decorates_association :user
    #decorates_association :solutions

    def show_image(css_class: '')
        h.image_tag self.image.url(:medium), class: "rounded #{css_class}"
    end

    def solved 
      solutions.where(user: current_user).order(created_at: :asc).first.solved
    end
  
    def formatted_created_at
        created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
  end