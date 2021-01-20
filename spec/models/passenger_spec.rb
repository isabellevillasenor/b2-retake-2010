require 'rails_helper'

describe Passenger do 
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_numericality_of(:age).is_greater_than(0) }
  end

  describe 'relationships' do
    it { should have_many :passenger_flights }
    it { should have_many(:flights).through(:passenger_flights) }
  end
end