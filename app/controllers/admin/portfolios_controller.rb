class Admin::PortfoliosController < AdminController
  before_action :find_portfolio, only: [:edit, :update, :destroy]
  
  def index
    if params[:query]
      @admin_portfolios = Admin::Portfolio.search(params[:query]).includes(:image).order(sort: :asc).page(params[:page]).per(10)
      params[:query] = nil
    else
      @admin_portfolios = Admin::Portfolio.includes(:image).order(sort: :asc).page(params[:page]).per(10)
    end
  end

  def new
    @admin_portfolio = Admin::Portfolio.new
    @admin_portfolio.build_image
  end

  def create
    @admin_portfolio = Admin::Portfolio.new(portfolio_params)
    if @admin_portfolio.save
      redirect_to admin_portfolios_path, notice: 'Portfolio Created'
    else
      render :new
      flash[alert] = 'Something Went Wrong'
    end
  end
  
  def edit
  end

  def update
    if @admin_portfolio.update(portfolio_params)
      redirect_to admin_portfolios_path, notice: 'Portfolio Updated'
    else
      render :edit
      flash[:edit] = 'Something Went Wrong'
    end
  end

  def destroy
    @admin_portfolio.destroy
    redirect_to admin_portfolios_path, notice: 'Portfolio Destroyed'
  end
  
  private

  def find_portfolio
    @admin_portfolio = Admin::Portfolio.find_by(id: params[:id])
  end

  def portfolio_params
    params.require(:admin_portfolio).permit(:title, :portfolio_type, :repo, :permalink, :description,
                                            image_attributes: [:id, :page, :src, :alt, :_destroy])
  end

end