class Booking < ApplicationRecord
  belongs_to :user      
  belongs_to :vehicle
  has_one :driver, through: :vehicle, source: :user
  has_many :payments
  has_many :ratings, as: :rateable
end
