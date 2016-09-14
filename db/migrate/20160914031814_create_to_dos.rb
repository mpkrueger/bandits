class CreateToDos < ActiveRecord::Migration[5.0]
  def change
    create_table :to_dos do |t|
      t.references :goal, foreign_key: true
      t.string :item
      t.integer :assignee

      t.timestamps
    end
  end
end
