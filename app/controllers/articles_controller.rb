class ArticlesController < ApplicationController
 
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
    @article = Article.find_by(permalink: params[:id])
  end

end