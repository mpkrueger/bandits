class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :approach, array: true, default: []
      t.text :thoughts
      t.references :goal, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
