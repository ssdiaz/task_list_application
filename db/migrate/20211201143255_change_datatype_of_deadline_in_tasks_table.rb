class ChangeDatatypeOfDeadlineInTasksTable < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :deadline, :string
  end
end
