class TrailResults 

  def initialize(city_state)
    @city_state = city_state
  end

  def lat_lon
    MapService.new.get_lat_lon(@city_state)[:results][0][:locations][0][:latLng]
  end

  def weather_data
    WeatherService.new.get_weather(lat_lon[:lat], lat_lon[:lng])
  end

  def trail_data
    TrailService.new.get_trails(lat_lon[:lat], lat_lon[:lng])[:trails]
  end

  def create_trail_objects
    location = create_location
    create_trails(location)
  end

  def create_location
    Location.create(name: @city_state,
                    forecast_summary: weather_data[:current][:weather][0][:description],
                    forecast_temp: weather_data[:current][:temp])
  end

  def create_trails(location)
    trail_data.each do |trail|
      location.trails.create(name: trail[:name],
                            summary: trail[:summary],
                            difficulty: trail[:difficulty],
                            location: trail[:location],
                            distance_to_trail: distance_to_trail(trail[:latitude], trail[:longitude]))
    end
  end

  def distance_to_trail(to_lon, to_lat)
    binding.pry
  end
  
end