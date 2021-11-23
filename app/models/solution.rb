# frozen_string_literal: true

class Solution < ApplicationRecord
  include Authors

  belongs_to :user
  belongs_to :puzzle

  scope :current_user_solutions, ->(current_user) { where(user: current_user).order(created_at: :desc) }
  scope :solutions_solved, lambda { |current_user|
                             current_user_solutions(current_user).where(solved: true).order(created_at: :desc)
                           }
  scope :solutions_unsolved, -> { includes(:user).current_user_solutions.where(solved: false).order(created_at: :desc) }
end
