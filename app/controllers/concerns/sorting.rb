# frozen_string_literal: true

module Sorting
    extend ActiveSupport::Concern
  
    
    included do
  
      def sort_by_params
        if params[:sort] == "solved"
            @pagy, @puzzles = pagy Puzzle.joins(:solutions).merge(Solution.solutions_solved), items: 5
            @puzzles = @puzzles.decorate
          elsif params[:sort] == "unsolved"
            @pagy, @puzzles = pagy Puzzle.joins(:solutions).merge(Solution.solutions_unsolved), items: 5
            @puzzles = @puzzles.decorate
          elsif params[:sort] == "author"
            @pagy, @puzzles = pagy Puzzle.current_user_author_puzzles(current_user), items: 5
            @puzzles = @puzzles.decorate  
          end
    end
  
      helper_method :sort_by_params
    end
    
  end
  