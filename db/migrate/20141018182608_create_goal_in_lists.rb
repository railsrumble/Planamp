class CreateGoalInLists < ActiveRecord::Migration
  def change
    create_table :goal_in_lists do |t|
      t.integer :goal_id
      t.integer :goal_list_id
      t.string :aasm_state

      t.timestamps
    end
  end
end
