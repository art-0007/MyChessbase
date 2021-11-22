# frozen_string_literal: true

module Sorting
  extend ActiveSupport::Concern

  included do
    def sort_by_params
      case params[:sort]
      when 'solved'
        @pagy, @puzzles = pagy Puzzle.puzzles_solved_by_user, items: 5
        @puzzles = @puzzles.decorate
      when 'author'
        @pagy, @puzzles = pagy Puzzle.current_user_author_puzzles(current_user), items: 5
        @puzzles = @puzzles.decorate
      end
    end

    helper_method :sort_by_params
  end
end
