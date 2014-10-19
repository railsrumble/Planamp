class UserGoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goals = current_user.goals
    @goals_in_list = current_user.grouped_goals_in_list
    @empty_goals_in_list = current_user.goal_in_lists.blank?
  end

  # Move to another controller
  def share
    @goal = Goal.find(params[:id])
    if @goal.share!
      flash[:notice] =  "Goal successfully shared!
        Now everyone can access it through <Shared> category."
    else
      flash[:error] = "Error in goal sharing"
    end

    redirect_to(action: :index)
  end
end