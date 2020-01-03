class Doctor < ApplicationRecord
  belongs_to :role
  validates :first_name, :last_name, :years_experience, :price, presence: true
end
