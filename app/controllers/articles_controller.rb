class ArticlesController < ApplicationController
  def index
    # setted this up to fetch all the article from the database this @article variable will be used in anywhere of the app folder so that user can access the articles list
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
