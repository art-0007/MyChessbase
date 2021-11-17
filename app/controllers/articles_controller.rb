# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :require_current_user, except: %i[show index]
  before_action :set_article!, only: %i[show edit update destroy]
  before_action :authorize_article!
  after_action :verify_authorized
  before_action :fetch_tags, only: %i[new edit]

  def index
    @pagy, @articles = pagy Article.all_by_tags(params[:tag_ids]), items: 5
    @articles = @articles.decorate
    @tags = Tag.all
  end

  def new
    @article = Article.new
  end

  def create
    # binding.pry
    @article = current_user.articles.build article_params
    if @article.save
      flash[:success] = 'Article created!'
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
    @article = @article.decorate
  end

  def edit; end

  def update
    if @article.update article_params
      flash[:success] = 'Article updated!'
      redirect_to articles_path(@article, anchor: "article-#{@article.id}")
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article deleted!'
    redirect_to articles_path
  end

  private

  def fetch_tags
    @tags = Tag.all
  end

  def set_article!
    @article = Article.find params[:id]
  end

  def authorize_article!
    authorize(@article || Article)
  end

  def article_params
    params
      .require(:article)
      .permit(:title, :body, :user_id, tag_ids: [])
  end
end
