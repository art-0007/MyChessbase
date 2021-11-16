# frozen_string_literal: true

class CategoriesController < ApplicationController
  after_action :verify_authorized
  
  def index
    @pagy, @categories = pagy Category.order(created_at: :desc), items: 5
    @categories = @categories.decorate
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

  def category_params
    params.require(:category).permit(:name)
  end
end
