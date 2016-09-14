class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.references :goal, foreign_key: true
      t.integer :total_cost
      t.decimal :down_payment_percent
      t.date :date

      t.timestamps
    end
  end
end
