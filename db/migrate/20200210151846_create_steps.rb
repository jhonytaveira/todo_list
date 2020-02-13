class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :name, null: false
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
