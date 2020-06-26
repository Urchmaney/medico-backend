class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_image
      t.string :role
      t.integer :price
      t.integer :years_experience
      t.timestamps
    end
  end
end
