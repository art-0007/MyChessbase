# frozen_string_literal: true

class Article < ApplicationRecord
  include Commentable
  include Authors

  belongs_to :user
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags

  has_attached_file :image, styles: { medium: '400x400#' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}

  scope :all_by_tags, lambda { |tag_ids|
    articles = includes(:user, :article_tags, :tags)
    articles = articles.joins(:tags).where(tags: tag_ids) if tag_ids
    articles.order(created_at: :desc)
  }
end
