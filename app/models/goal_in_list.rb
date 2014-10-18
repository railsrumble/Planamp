class GoalInList < ActiveRecord::Base
  include AASM

  belongs_to :goal
  belongs_to :goal_list

  aasm do
    state :pending, initial: true
    state :done
    state :failed

    event :achieve_dream do
      transitions from: :pending, to: :done
    end

    event :fail_dream do
      transitions from: :pending, to: :failed
    end
  end

end
