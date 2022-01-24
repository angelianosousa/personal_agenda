class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :subject, foreign_key: true
      t.string :title
      t.text :description
      t.datetime :start_time
      t.boolean :finish, default: false

      t.timestamps
    end
  end
end
