# frozen_string_literal: true

class Article < ApplicationRecord
  include Commentable
  include Authors

    belongs_to :user
    has_many :article_tags, dependent: :destroy
    has_many :tags, through: :article_tags
end
