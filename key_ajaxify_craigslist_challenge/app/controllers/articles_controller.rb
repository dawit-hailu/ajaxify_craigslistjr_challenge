class ArticlesController < ApplicationController
# I Should Never Eat Cookies Under Duress
def index
  @category = Category.find(params[:category_id])
  @category_articles = @category.articles
end

def show
  p params
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
end

def new
  @category = Category.find(params[:category_id])
  @article = Article.new
end

def edit
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
end

def create
  @category = Category.find(params[:category_id])
  @article = @category.articles.create(article_params)

  respond_to do |format|
    format.js
    format.html {
      if @article.save
        redirect_to category_articles_path
      else
        render 'new'
      end
    }
    end
end

def update
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])


  if @article.update(article_params)
    redirect_to category_article_path(@category, @article)
  else
    render 'edit'
  end
end

def destroy
  @article = Article.find(params[:id])
  @category = @article.category

  @article.destroy
  redirect_to category_articles_path
end

private
def article_params
  params.require(:article).permit(:title, :body, :category_id)
end

end
