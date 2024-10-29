class Room < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :number, presence: true
  validates :room_type, presence: true # , length: { minimum: 10 }
end
