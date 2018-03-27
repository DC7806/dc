class ArticlesController < ApplicationController
  
  before_action :page_meta, only: :index 
  
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
    @article = Article.find_by(permalink: params[:id])
    page_meta @article
  end

end
