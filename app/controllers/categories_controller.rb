class CategoriesController < ApplicationController
  def index
    @shared_category = Category.shared
    @categories = Category.weighted - [@shared_category]
  end

  def show
    @category_with_goals = Category.find(params[:id])
  end
end
