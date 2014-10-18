class GoalList < ActiveRecord::Base
  belongs_to :user
  has_many :goal_in_lists
  has_many :goals, through: :goal_in_lists

  validates :user, presence: true

  def add_goal(goal)
    exist_pending_goal = goal_in_lists.where(goal_id: goal.id, aasm_state: :pending).first
    goal_shared_and_approved = goal.shared? && goal.approved?

    if goal_shared_and_approved && !exist_pending_goal
      goal_in_list = goal_in_lists.build
      goal_in_list.goal = goal
      fail("Goal not saved in add_goal!") unless goal_in_list.save
      return true
    else
      return false
    end
  end

  def is_pending?(goal)
    goal_in_list = goal_in_lists.where(goal_id: goal.id).first
    goal_in_list && goal_in_list.pending?
  end
end
