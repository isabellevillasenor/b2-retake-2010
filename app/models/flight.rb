class Flight < ApplicationRecord
  validates_presence_of :departure_city, :arrival_city
  validates_numericality_of :flight_number
  belongs_to :airline
  has_many :passenger_flights, dependent: :destroy
  has_many :passengers, through: :passenger_flights
end