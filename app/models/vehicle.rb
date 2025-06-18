class Vehicle < ApplicationRecord
  belongs_to :user      
  has_many :bookings
  has_many :ratings, as: :rateable
  has_and_belongs_to_many :tags
end
