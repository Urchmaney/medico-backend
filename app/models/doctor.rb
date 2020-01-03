class Doctor < ApplicationRecord
  validates :first_name, :last_name, :years_experience, :price, presence: true
end
