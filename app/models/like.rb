class Like < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, counter_cache: true
end
