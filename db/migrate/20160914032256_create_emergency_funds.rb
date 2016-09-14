class CreateEmergencyFunds < ActiveRecord::Migration[5.0]
  def change
    create_table :emergency_funds do |t|
      t.references :goal, foreign_key: true
      t.date :date
      t.integer :monthly_expenses
      t.integer :num_months

      t.timestamps
    end
  end
end
