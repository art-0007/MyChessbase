# frozen_string_literal: true

class Article < ApplicationRecord
  include Commentable
  include Authors

    belongs_to :user
    has_many :article_tags, dependent: :destroy
    has_many :tags, through: :article_tags

    scope :all_by_tags, ->(tag_ids) do
        articles = includes(:user, :article_tags, :tags)
        articles = articles.joins(:tags).where(tags: tag_ids) if tag_ids
        articles.order(created_at: :desc)
    end

end
