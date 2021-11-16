# frozen_string_literal: true

class Solution < ApplicationRecord
  include Authors
  
  belongs_to :user
  belongs_to :puzzle
end
