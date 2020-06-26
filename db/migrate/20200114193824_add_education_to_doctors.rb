class AddEducationToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :educations, :string
    add_column :doctors, :specializations, :string
  end
end
