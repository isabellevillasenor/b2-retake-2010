require 'rails_helper'

describe 'Airlines Show Page' do
  before :each do 
    @a1 = Airline.create!(name: 'Airline 1')

    @f1 = @a1.flights.create!(flight_number: 123, date: '2012-03-27 14:54:09', departure_city: 'Denver', arrival_city: 'Houston')
    @f2 = @a1.flights.create!(flight_number: 456, date: '2012-03-28 14:54:09', departure_city: 'Tucson', arrival_city: 'Denver')
    @f3 = @a1.flights.create!(flight_number: 789, date: '2012-03-27 14:00:00', departure_city: 'Denver', arrival_city: 'Chicago')

    @p1 = Passenger.create!(name: 'Passenger 1', age: 21)
    @p2 = Passenger.create!(name: 'Passenger 2', age: 34)
    @p3 = Passenger.create!(name: 'Passenger 3', age: 12)
    @p4 = Passenger.create!(name: 'Passenger 4', age: 46)
    @p5 = Passenger.create!(name: 'Passenger 5', age: 52)
    @p6 = Passenger.create!(name: 'Passenger 6', age: 27)
    @p7 = Passenger.create!(name: 'Passenger 7', age: 18)
    @p8 = Passenger.create!(name: 'Passenger 8', age: 39)

    PassengerFlight.create!(flight_id: @f1.id, passenger_id: @p1.id)
    PassengerFlight.create!(flight_id: @f1.id, passenger_id: @p2.id)
    PassengerFlight.create!(flight_id: @f2.id, passenger_id: @p3.id)
    PassengerFlight.create!(flight_id: @f2.id, passenger_id: @p4.id)
    PassengerFlight.create!(flight_id: @f3.id, passenger_id: @p5.id)
    PassengerFlight.create!(flight_id: @f3.id, passenger_id: @p6.id)
    PassengerFlight.create!(flight_id: @f3.id, passenger_id: @p7.id)
    PassengerFlight.create!(flight_id: @f3.id, passenger_id: @p1.id)
    visit airline_path(@a1)
  end

  it 'should display a unique list of all passengers that have flights from that airline' do
    expect(page).to have_content(@p1.name)
    expect(page).to have_content(@p2.name)
    expect(page).to have_content(@p3.name)
    expect(page).to have_content(@p4.name)
    expect(page).to have_content(@p5.name)
    expect(page).to have_content(@p6.name)
    expect(page).to have_content(@p7.name)

    expect(page).to_not have_content(@p8.name)
  end
end