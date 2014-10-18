class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :weight # for sorting

      t.timestamps
    end

    add_index :categories, :weight

    execute("INSERT INTO categories(name, weight) VALUES('Sport', 2)")
    execute("INSERT INTO categories(name, weight) VALUES('Food', 1)")
    execute("INSERT INTO categories(name, weight) VALUES('Personal development', 3)")
    execute("INSERT INTO categories(name, weight) VALUES('Shared', 4)")
  end
end
