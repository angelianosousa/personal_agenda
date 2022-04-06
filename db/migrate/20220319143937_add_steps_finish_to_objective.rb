class AddStepsFinishToObjective < ActiveRecord::Migration[6.0]
  def change
    add_column :objectives, :steps_finish, :integer, default: 0
  end
end
