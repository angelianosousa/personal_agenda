class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :deadline
      t.text :description, default: ""

      t.timestamps
    end
  end
end
