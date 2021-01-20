class PassengersController < ApplicationController
  def destroy
    Passenger.destroy(params[:id])
    redirect_to flights_path
  end
end