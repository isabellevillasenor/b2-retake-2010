class FlightsController < ApplicationController
  def index
    @flights = Flight.order_by_passenger
  end
end