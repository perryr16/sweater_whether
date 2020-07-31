class WeatherResults 

  def initialize(location)
    @location = location
  end

  def weather_service
    WeatherService.new
  end

  def map_service 
    MapService.new.get_lat_lon(@location)
  end

  def lat_lon  
    map_service[:results][0][:locations][0][:latLng]
  end

  def location_details
    result = map_service
  end

  def create_weather_object
    binding.pry
    weather_data = weather_service.get_weather(lat_lon[:lat], lat_lon[:lng])
    Weather.new(@location, weather_data)
  end
  
end