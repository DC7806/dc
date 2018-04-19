class ArticlesController < ApplicationController
  
  before_action :page_meta, only: :index 
  
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
    @article = Article.find_by(permalink: params[:id])
    if @article.blank?
      redirect_to articles_path
      flash[:alert] = 'Page Not Found'
    else
      page_meta @article
    end
  end

end
