class TrailResults 

  def initialize(city_state)
    @city_state = city_state
    @location_id = nil
  end

  def create_trail_objects
    location = create_location
    @location_id = location.id
    create_trails(location)
  end

  def format_response
    create_trail_objects
    location = Location.find(@location_id)

    {data: {
      attributes: {
        location: location.name,
        forecast: {
          summary: location.forecast_summary,
          temperature: location.forecast_temp,
        },
        trails: 
          location.trails.map do |trail|
            {name: trail.name,
            summary: trail.summary,
            difficulty: trail.difficulty,
            location: trail.location,
            distance_to_trail: trail.distance_to_trail}
          end
        }
      }
    }
  end

  private 

  def lat_lon
    MapService.new.get_lat_lon(@city_state)[:results][0][:locations][0][:latLng]
  end

  def weather_data
    WeatherService.new.get_weather(lat_lon[:lat], lat_lon[:lng])
  end

  def trail_data
    TrailService.new.get_trails(lat_lon[:lat], lat_lon[:lng])[:trails]
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

  def distance_to_trail(to_lat, to_lon)
    to_lat_lon = "#{to_lat},#{to_lon}"
    from_lat_lon = "#{lat_lon[:lat]},#{lat_lon[:lng]}"
    map_data = MapService.new.get_directions(to_lat_lon, from_lat_lon)
    map_data[:route][:distance]
  end


  
end