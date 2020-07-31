class Weather < ApplicationRecord
  has_many :dailies
  has_many :hourlies

  def initialize(location, weather_data)
    @location = location
  end
end
