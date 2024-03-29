# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :role
  has_many :appointments
  has_many :patients, through: :appointments, source: :user
  has_many :likes
  has_many :liked_by, through: :likes, source: :user
  validates :first_name, :last_name, :years_experience, :price, presence: true
end
