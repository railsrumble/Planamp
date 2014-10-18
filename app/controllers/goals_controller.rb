class GoalsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @category_with_goals = Category.weighted.includes(:available_goals)
  end

  def new
    @goal = Goal.new
    #TODO: It should be dynamic
    motivations_count = 3
    motivations_count.times{ @goal.motivations.build }
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if current_user.admin?
      @goal.shared = true #NOTE: This line only for admin
    else
      @goal.category = Category.shared
    end

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
    params.require(:goal).permit(:title, :description, :category_id,
      motivations_attributes: [:id, :title, :source, :description])
  end
end
