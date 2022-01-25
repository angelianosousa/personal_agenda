class AddTasksCountToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :tasks_count, :integer, default: 0
  end
end
