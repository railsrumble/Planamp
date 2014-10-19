class CategoriesController < ApplicationController
  def index
    @shared_category = Category.shared
    @categories = Category.weighted - [@shared_category]

    if params[:screenshot] == "true"
      filepath = "#{Rails.root}/public/screenshoot-planamp.png"
      render :text => File.open(filepath, 'rb').read,
             :status => 200, :content_type => 'image/png'
    end
  end

  def show
    @category_with_goals = Category.find(params[:id])
  end
end
