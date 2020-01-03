class User < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments, source: :doctor
  validates :username, :first_name, :last_name, presence: true
end
