# frozen_string_literal: true

class Article < ApplicationRecord
  include Commentable
  include Authors

  belongs_to :user
end
