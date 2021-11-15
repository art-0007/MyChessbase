# frozen_string_literal: true

class Article < ApplicationRecord
  include Commentable

  belongs_to :user
end
