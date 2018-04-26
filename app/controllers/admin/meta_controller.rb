class Admin::MetaController < AdminController
  
  before_action :find_metum, only:[:edit, :update]
  
  def index
    @admin_meta = []
    ['home', 'articles'].each do |name|
      @admin_meta << Admin::Metum.where(page: name).first
    end
  end

  def edit
  end

  def update
    if @admin_metum.update(metum_params)
      redirect_to admin_meta_path, notice: 'Meta Updated'
    else
      render :edit
    end
  end

  private

  def find_metum
    @admin_metum = Admin::Metum.find_by(id: params[:id])
  end

  def metum_params
    params.require(:admin_metum).permit(:page, :title, :meta_description, :og_title, :og_description, :og_image)
  end

end