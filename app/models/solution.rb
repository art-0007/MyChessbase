# frozen_string_literal: true

class Solution < ApplicationRecord
  belongs_to :user
  belongs_to :puzzle
end
