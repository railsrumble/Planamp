class CreateMotivations < ActiveRecord::Migration
  def change
    create_table :motivations do |t|
      t.string :title, null: false
      t.text :description
      t.string :source, null: false
      t.integer :goal_id, null: false

      t.timestamps
    end
  end
end
