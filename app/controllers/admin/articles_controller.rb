class Admin::ArticlesController < AdminController

  before_action :find_article, only: [:edit, :update, :destroy]
  
  def index
    if params[:query]
      @admin_articles = Admin::Article.search(params[:query]).includes(:image).order(created_at: :desc).page(params[:page]).per(10)
      params[:query] = nil
    else
      @admin_articles = Admin::Article.includes(:image).order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def new
    @admin_article = Admin::Article.new
    @admin_article.build_image
    @admin_article.build_metum
  end

  def create
    @admin_article = Admin::Article.new(article_params)
    if @admin_article.save
      redirect_to admin_articles_path, notice: 'Article Created'
    else
      render :new
      flash[alert] = 'Something Went Wrong'
    end
  end
  
  def edit
  end

  def update
    if @admin_article.update(article_params)
      redirect_to admin_articles_path, notice: 'Article Updated'
    else
      render :edit
      flash[:edit] = 'Something Went Wrong'
    end
  end

  def destroy
    @admin_article.destroy
    redirect_to admin_articles_path, notice: 'Article Destroyed'
  end
  
  private

  def find_article
    @admin_article = Admin::Article.find_by(id: params[:id])
  end

  def article_params
    params.require(:admin_article).permit(:title, :description, :permalink, :content,
                                         image_attributes: [:id, :page, :src, :alt, :_destroy],
                                         metum_attributes: [:id, :page, :title, :meta_description, :og_title, :og_description, :og_image, :_destroy],
                                         category_ids: [])
  end

end
