class AddRoleidToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :role_id, :integer
  end
end
