class CreateObjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :objectives do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :deadline
      t.integer :steps_count, null: false, default: 0

      t.timestamps
    end
  end
end
