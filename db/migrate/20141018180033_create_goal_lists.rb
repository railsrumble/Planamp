class CreateGoalLists < ActiveRecord::Migration
  def change
    create_table :goal_lists do |t|
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :goal_lists, :user_id
  end
end
