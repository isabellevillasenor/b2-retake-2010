class Airline < ApplicationRecord
  validates_presence_of :name
  has_many :flights, dependent: :destroy
  has_many :passengers, through: :flights

  def passenger_list
    passengers.order(name: :desc).distinct.pluck(:name)
  end
end