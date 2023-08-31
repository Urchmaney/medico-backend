# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :doctors
  validates :name, presence: true
end
