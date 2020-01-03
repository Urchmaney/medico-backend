class User < ApplicationRecord
  validates :username, :first_name, :last_name, presence: true
end
