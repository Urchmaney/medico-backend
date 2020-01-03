class Doctor < ApplicationRecord
  belongs_to :role
  has_many :appointments
  has_many :patients, through: :appointments, source: :user
  validates :first_name, :last_name, :years_experience, :price, presence: true
end
