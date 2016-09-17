class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :voting_for
      t.boolean :want_this, default: false
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
