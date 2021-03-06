class Passenger < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :age, greater_than: 0
  has_many :passenger_flights, dependent: :destroy
  has_many :flights, through: :passenger_flights
end