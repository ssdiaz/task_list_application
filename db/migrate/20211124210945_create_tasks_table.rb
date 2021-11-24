class CreateTasksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description # optional
      t.date :deadline # optional
      t.string :priority # low, medium, high # optional; default at low
      t.integer :user_id

      t.timestamps
    end
  end
end
