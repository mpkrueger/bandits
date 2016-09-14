class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.references :goal, foreign_key: true
      t.string :kid_name
      t.integer :kid_age
      t.integer :cost_estimate
      t.decimal :percentage_to_pay

      t.timestamps
    end

    remove_column :comments, :body, :text
    add_column :comments, :message, :text

  end
end
