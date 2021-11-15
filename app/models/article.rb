class Article < ApplicationRecord
    include Commentable
    
    belongs_to :user

end
