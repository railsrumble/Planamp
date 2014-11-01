class GoalsInListController < ApplicationController
  before_action :authenticate_user!

  def done
    goal_in_list = GoalInList.find(params[:id])
    goal_in_list.achieve_dream!

    redirect_to :back
  end

  def fail
    goal_in_list = GoalInList.find(params[:id])
    goal_in_list.fail_dream!

    redirect_to :back
  end

  def add_goal_to_list
    @goal = Goal.find(params[:id])
    goal_list = current_user.goal_list
    if goal_list.add_goal(@goal)
      flash[:notice] = "Goal successfully added to your goal list"
      redirect_to user_goals_url
    else
      flash[:error] = "Error on adding goal to goal list"
      redirect_to :back
    end
  end
end
