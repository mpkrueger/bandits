class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.references :family, foreign_key: true
      t.integer :created_by_user_id

      t.timestamps
    end
  end
end
