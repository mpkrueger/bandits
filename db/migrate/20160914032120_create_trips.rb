class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.references :goal, foreign_key: true
      t.string :place
      t.integer :duration
      t.date :date
      t.integer :flight_cost
      t.integer :hotel_cost
      t.integer :fun_cost

      t.timestamps
    end
  end
end
