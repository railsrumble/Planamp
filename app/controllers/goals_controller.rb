class GoalsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @category_with_goals = Category.weighted.includes(:goals)
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to @goal, success: "Goal successfully created!"
    else
      render 'new'
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end


  protected


  def goal_params
    params.require(:goal).permit(:title, :description, :category_id)
  end
end
