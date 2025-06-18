class Driver < ApplicationRecord
  has_one :user, as: :userable, dependent: :destroy
  has_many :vehicles
end
