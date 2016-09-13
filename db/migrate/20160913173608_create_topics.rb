class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :message
      t.text :body
      t.date :due_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
