require 'rails_helper'

describe Flight do 
  describe 'validations' do
    it { should validate_presence_of :departure_city }
    it { should validate_presence_of :arrival_city }
    it { should validate_numericality_of :flight_number }
  end

  describe 'relationships' do
    it { should belong_to :airline }
    it { should have_many :passenger_flights }
    it { should have_many(:passengers).through(:passenger_flights) }
  end
end