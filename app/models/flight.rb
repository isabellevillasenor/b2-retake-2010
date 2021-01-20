class Flight < ApplicationRecord
  validates_presence_of :departure_city, :arrival_city
  validates_numericality_of :flight_number
  belongs_to :airline
  has_many :passenger_flights, dependent: :destroy
  has_many :passengers, through: :passenger_flights
  
  def self.order_by_passenger
    joins(:passengers)
    .select('flights.*, count(passengers) as passenger_count')
    .group('flights.id')
    .order('passenger_count desc')
  end
end