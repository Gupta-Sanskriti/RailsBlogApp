class ArticlesController < ApplicationController
  def index
    # setted this up to fetch all the article from the database this @article variable will be used in anywhere of the app folder so that user can access the articles list
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article  # if the value is saved successfully then it redirects to that particular page
     else
      render :new, status: :unprocessable_entity   #if the values is not saved it will go to the same new page, with error <422>
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
