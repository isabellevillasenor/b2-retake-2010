require 'rails_helper'

describe 'Flights Index Page' do 
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
    @p9 = Passenger.create!(name: 'Passenger 9', age: 13)

    PassengerFlight.create!(flight_id: @f1.id, passenger_id: @p1.id)
    PassengerFlight.create!(flight_id: @f1.id, passenger_id: @p2.id)
    PassengerFlight.create!(flight_id: @f2.id, passenger_id: @p3.id)
    PassengerFlight.create!(flight_id: @f2.id, passenger_id: @p4.id)
    PassengerFlight.create!(flight_id: @f3.id, passenger_id: @p5.id)
    PassengerFlight.create!(flight_id: @f3.id, passenger_id: @p6.id)
    PassengerFlight.create!(flight_id: @f3.id, passenger_id: @p7.id)
    PassengerFlight.create!(flight_id: @f3.id, passenger_id: @p9.id)
    visit flights_path
  end

  it 'should display all the flight numbers' do
    expect(page).to have_content('All Flights with List of Passengers')
    expect(page).to have_content("Flight Number: #{@f1.flight_number}")
    expect(page).to have_content("Flight Number: #{@f2.flight_number}")
    expect(page).to have_content("Flight Number: #{@f3.flight_number}")
  end

  it 'should display all the passengers names on that flight' do
    expect(page).to have_content('All Passengers On Board Flight:')
    expect(page).to have_content(@p1.name)
    expect(page).to have_content(@p2.name)
    expect(page).to have_content(@p3.name)
    expect(page).to have_content(@p4.name)
    expect(page).to have_content(@p5.name)
    expect(page).to have_content(@p6.name)
    expect(page).to have_content(@p7.name)
    expect(page).to have_content(@p9.name)

    expect(page).to_not have_content(@p8.name)
  end

  it 'should have flights ordered by how many passengers are on a flight' do
    expect("Flight Number: #{@f3.flight_number}").to appear_before("Flight Number: #{@f1.flight_number}")
  end

  it 'should have a link to delete passenger from flight' do
    expect(page).to have_link("Delete #{@p7.name} From Flight")
    click_link "Delete #{@p7.name} From Flight"

    expect(current_path).to eq(flights_path)
    expect(page).to_not have_content(@p7.name)
  end
end