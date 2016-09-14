class AddCompletedFieldToToDoTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :to_dos, :completed, :boolean, default: false  
  end
end
