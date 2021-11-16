# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable!
  after_action :verify_authorized

  def create
    @comment = @commentable.comments.build comment_params
    authorize @comment

    if @comment.save
      flash[:success] = 'Comment created!'
    else
      @comment = @comment.decorate
      flash[:warning] = 'Comment create error! Must be minimum 2 characters and not blank.'
    end
    redirect_to @commentable
  end

  def destroy
    comment = @commentable.comments.find params[:id]
    authorize comment
    comment.destroy
    flash[:success] = 'Comment deleted!'
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def set_commentable!
    klass = [Puzzle, Article].detect { |c| params["#{c.name.underscore}_id"] }
    raise ActiveRecord::RecordNotFound if klass.blank?

    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
