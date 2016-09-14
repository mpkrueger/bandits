class CreateRetirements < ActiveRecord::Migration[5.0]
  def change
    create_table :retirements do |t|
      t.references :goal, foreign_key: true
      t.date :date
      t.integer :monthly_expenses
      t.integer :target_amount

      t.timestamps
    end
  end
end
