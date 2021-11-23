# frozen_string_literal: true

class SolutionsController < ApplicationController
  before_action :require_current_user
  before_action :set_puzzle!

  def create
    @solution = @puzzle.solutions.build solution_create_params
    check_solution
    # binding.pry
    if @solution.solved? && @solution.save
      flash[:success] = 'Puzzle Solved!'
      redirect_to puzzle_path(@puzzle)
    else
      @puzzle = @puzzle.decorate
      flash.now[:warning] = 'Incorrect Solution! Please try again.'
      render 'puzzles/show'
    end
  end

  def destroy
    solution = @puzzle.solutions.find params[:id]
    solution.destroy
    flash[:success] = 'Solution deleted!'
    redirect_to puzzle_path(@puzzle)
  end

  private

  def set_puzzle!
    @puzzle = Puzzle.find params[:puzzle_id]
  end

  def solution_update_params
    params
      .require(:solution)
      .permit(:body, :solved)
  end

  def solution_create_params
    params
      .require(:solution)
      .permit(:body, :solved).merge(user_id: current_user.id)
  end
end
