class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.references :board, foreign_key: true, null: false
      t.references :step, foreign_key: true, null: false

      t.timestamps
    end
  end
end
