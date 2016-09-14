class AddGoalToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :goal, foreign_key: true
  end
end
