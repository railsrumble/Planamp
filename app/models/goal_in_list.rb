class GoalInList < ActiveRecord::Base
  include AASM

  belongs_to :goal
  belongs_to :goal_list

  delegate :title, to: :goal

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

  scope :pending, -> {where(aasm_state: 'pending')}
  scope :done, -> {where(aasm_state: 'done')}
  scope :failed, -> {where(aasm_state: 'failed')}

end
