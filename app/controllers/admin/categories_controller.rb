class Admin::CategoriesController < AdminController
  before_action :find_category, only: [:edit, :update, :destroy]
  
  def index
    @admin_categories = Admin::Category.order(created_at: :desc)
  end

  def new
    @admin_category = Admin::Category.new
    @admin_category.build_image
    @admin_category.build_metum
  end

  def create
    @admin_category = Admin::Category.new(category_params)
    if @admin_category.save
      redirect_to admin_categories_path, notice: 'Category Created'
    else
      render :new
      flash[alert] = 'Something Went Wrong'
    end
  end
  
  def edit
  end

  def update
    if @admin_category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category Updated'
    else
      render :edit
      flash[:edit] = 'Something Went Wrong'
    end
  end

  def destroy
    @admin_category.destroy
    redirect_to admin_categories_path, notice: 'Category Destroyed'
  end
  
  private

  def find_category
    @admin_category = Admin::Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:admin_category).permit(:name, :permalink,
                                          image_attributes: [:id, :page, :src, :alt, :_destroy],
                                          metum_attributes: [:id, :page, :title, :meta_description, :og_title, :og_description, :og_image, :_destroy])
  end
  
end
