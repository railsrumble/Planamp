class AddSharedColumnToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :shared, :boolean, default: false

    execute('UPDATE goals SET shared=true')
  end
end
