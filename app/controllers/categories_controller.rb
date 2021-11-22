# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :require_current_user, except: %i[show index]
  before_action :authorize_category!
  after_action :verify_authorized

  def index
    @pagy, @categories = pagy Category.order(created_at: :desc), items: 5
    @categories = @categories.decorate
    #binding.pry
    @user_author_puzzles = Puzzle.current_user_author_puzzles current_user
    @solved_puzzles = Puzzle.joins(:solutions).merge(Solution.solutions_solved)
    @unsolved_puzzles = Puzzle.joins(:solutions).merge(Solution.solutions_unsolved)
    
  end

  def show
    @category = Category.find(params[:id]).decorate
    @pagy, @puzzles = pagy @category.puzzles, items: 5
    @puzzles = @puzzles.decorate
  end

  def new
    @category = Category.new(category_params)
  end

  private

  def authorize_category!
    authorize(@category || Category)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
