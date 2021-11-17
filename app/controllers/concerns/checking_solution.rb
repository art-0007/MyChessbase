# frozen_string_literal: true

module CheckingSolution
  extend ActiveSupport::Concern

  included do
    private
    def check_solution
      @solution.solved = true if @puzzle.solution == params[:solution][:body]
    end

    def solution_exists?
      @puzzle.solutions.exists?
    end

    def puzzle_solved?
      find_solution if solution_exists?
    end

    def find_solution
      @puzzle.solutions.where(user: current_user).order(created_at: :asc).first
    end

    def puzzle_user_solution
      find_solution.body
    end

    helper_method :puzzle_user_solution, :show_solved, :check_solution, :solution_exists?, :puzzle_solved?,
                  :find_solution
  end
end
