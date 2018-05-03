class PortfoliosController < ApplicationController
  before_action :page_meta
  def index
    @portfolios = Portfolio.order(created_at: :desc)
  end
end
