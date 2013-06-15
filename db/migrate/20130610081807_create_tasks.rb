class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :rate
      t.integer :hours

      t.timestamps
    end
  end
end
