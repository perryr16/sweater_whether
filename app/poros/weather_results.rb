class WeatherResults 

  def initialize(location)
    @location = location
  end

  def weather_service
    WeatherService.new
  end

  def map_service 
    MapService.new
  end
  
end