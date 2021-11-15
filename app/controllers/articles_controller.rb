# frozen_string_literal: true

class ArticlesController < ApplicationController
    before_action :set_article!, only: %i[show edit update destroy]
  
    def index
      @pagy, @articles = pagy Article.includes(:user).order(created_at: :desc), items: 5
      @articles = @articles.decorate
    end
  
    def new
      @article = Article.new
    end
  
    def create
      #binding.pry
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
  
    def set_article!
      @article = Article.find params[:id]
    end
  
    def article_params
      params
        .require(:article)
        .permit(:title, :body, :user_id)
    end
  end