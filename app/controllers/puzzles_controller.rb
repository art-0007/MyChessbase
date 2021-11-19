# frozen_string_literal: true

class PuzzlesController < ApplicationController
  before_action :require_current_user, except: %i[show index]
  before_action :set_puzzle!, only: %i[show edit update destroy]
  before_action :authorize_puzzle!
  after_action :verify_authorized

  def index

    if params[:sort]
      sort_by_params
    else
      @pagy, @puzzles = pagy Puzzle.puzzles_sorted, items: 5
      @puzzles = @puzzles.decorate
    end
    
  end

  def new
    @puzzle = Puzzle.new
  end

  def create
    @puzzle = current_user.puzzles.build puzzle_params
    puzzle_category = @puzzle.puzzle_categories.last
    puzzle_category.complexity = params[:puzzle][:complexity]
    if @puzzle.save
      flash[:success] = 'Puzzle created!'
      redirect_to puzzles_path
    else
      render :new
    end
  end

  def show
    @puzzle = @puzzle.decorate
    @solution = @puzzle.solutions.build
    @solution.decorate
  end

  def edit; end

  def update
    if @puzzle.update puzzle_params
      flash[:success] = 'Puzzle updated!'
      redirect_to puzzles_path(@puzzle, anchor: "puzzle-#{@puzzle.id}")
    else
      render :edit
    end
  end

  def destroy
    @puzzle.destroy
    flash[:success] = 'Puzzle deleted!'
    redirect_to puzzles_path
  end

  private

  def authorize_puzzle!
    authorize(@puzzle || Puzzle)
  end

  def set_puzzle!
    @puzzle = Puzzle.find params[:id]
  end

  def puzzle_params
    params
      .require(:puzzle)
      .permit(:title, :body, :solution, :user_id, :image, category_ids: [],
                                                          categories_attributes: [:name], puzzle_category_ids: [],
                                                          pazzle_categories_attributes: [:complexity])
  end
end
