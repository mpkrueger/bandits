class AddPartnerNameToInvitesTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :invites, :first_name, :string  
  end
end
