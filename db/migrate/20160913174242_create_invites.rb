class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string :email
      t.string :token
      t.references :family, foreign_key: true
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
