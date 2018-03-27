class CategoriesController < ApplicationController
  
  def show
    @category = Category.find_by(permalink: params[:id])
    page_meta @category
  end
  
end
