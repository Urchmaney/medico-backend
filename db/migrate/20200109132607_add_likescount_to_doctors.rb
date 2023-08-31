class AddLikescountToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :likes_count, :integer
  end
end
