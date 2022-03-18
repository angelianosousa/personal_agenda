class AddObjectiveIdToSteps < ActiveRecord::Migration[6.0]
  def change
    add_reference :steps, :objective, null: false, foreign_key: true
  end
end
