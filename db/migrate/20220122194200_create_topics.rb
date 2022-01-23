class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.references :subject, foreign_key: true
      t.string :title
      t.string :description
      t.date :due_to, default: Date.today
      t.string :status, default: "em andamento"

      t.timestamps
    end
  end
end
