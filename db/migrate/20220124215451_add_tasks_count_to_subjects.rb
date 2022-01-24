class AddTasksCountToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :tasks_count, :integer, default: 0
  end
end
