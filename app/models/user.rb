class User < ApplicationRecord
  belongs_to :userable, polymorphic: true
  has_many :bookings
  has_many :ratings
  has_many :rewards
  has_many :payments, through: :bookings

  def customer?
    userable_type == "Customer"
  end

  def driver?
    userable_type == "Driver"
  end
end
