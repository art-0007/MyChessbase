class Puzzle < ApplicationRecord
    belongs_to :user
    has_many :solutions, dependent: :destroy
    has_many :puzzle_categories
    has_many :categories, through: :puzzle_categories

    #validates :categories, presence: true

    has_attached_file :image, styles: { medium: "400x400#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    def categories_attributes=(categories_hashes)
        
        categories_hashes.each do |i, category_attributes|
         if category_attributes[:name].present?
          category = Category.find_or_create_by(name: category_attributes[:name])
              if !self.categories.include?(category)
              self.puzzle_categories.build(:category => category)
            end
          end
        end
    end

end
