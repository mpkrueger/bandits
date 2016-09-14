class CreateCustomGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_goals do |t|
      t.references :goal, foreign_key: true
      t.string :description
      t.date :date
      t.integer :target_amount

      t.timestamps
    end
  end
end
