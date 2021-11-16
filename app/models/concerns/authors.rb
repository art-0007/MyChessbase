# frozen_string_literal: true

module Authors
  extend ActiveSupport::Concern

  included do
    def authored_by?(user)
      self.user == user
    end
  end
end
