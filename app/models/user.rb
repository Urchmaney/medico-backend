# frozen_string_literal: true

class User < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments, source: :doctor
  has_many :likes
  has_many :doctors_liked, through: :likes, source: :doctor
  validates :username, :first_name, :last_name, presence: true
  validates :username, uniqueness: true
end
