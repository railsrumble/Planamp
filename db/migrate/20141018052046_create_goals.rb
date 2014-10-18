class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :description
      t.integer :category_id, null: false
      t.integer :user_id, null: false
      t.boolean :approved, default: true

      t.timestamps
    end

    add_index :goals, :user_id
    add_index :goals, :category_id
    add_index :goals, :approved
  end
end
