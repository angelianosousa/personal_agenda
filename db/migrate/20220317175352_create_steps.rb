class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :name
      t.date :deadline

      t.timestamps
    end
  end
end
