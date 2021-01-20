require 'rails_helper'

describe Airline do 
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :flights }
  end
end