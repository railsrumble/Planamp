class GoalsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @category_with_goals = Category.weighted.includes(:goals)
  end

  def new
  end

  def create
  end
end
