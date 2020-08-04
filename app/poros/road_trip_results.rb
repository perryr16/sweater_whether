class RoadTripResults 

  def initialize(params)
   @origin = params[:origin]
   @destination = params[:destination]
   @user = User.find_by(api_key: params[:api_key])
   @road_trip = nil
  end

  def format_response 
    create_road_trip
    if travel_time
      {
        origin: @road_trip.origin,
        destination: @road_trip.destination,
        travel_time: @road_trip.travel_time,
        travel_time_units: 'minutes',
        arrival_temp: @road_trip.arrival_temp,
        arrival_temp_units: 'F',
        arrival_summary: @road_trip.arrival_summary
      }
    end
  end

  def create_road_trip 
    road_trip = @user.road_trips.create(
      origin: @origin,
      destination: @destination,
      travel_time: travel_time/60.0,
      arrival_temp: arrival_weather_data[:temp],
      arrival_summary: arrival_weather_data[:summary]
    )
    @road_trip = road_trip
  end

  def travel_time
    travel_data = map_service.get_directions(@origin, @destination)
    travel_data[:route][:time]
  end

  def map_service
    MapService.new
  end 

  def lat_lon
    map_service.get_lat_lon(@destination)[:results][0][:locations][0][:latLng]
  end

  def arrival_weather_data
    data = WeatherService.new.get_weather(lat_lon[:lat], lat_lon[:lng])
    hour_index = (travel_time/3600.0).to_i
    {
      temp: data[:hourly][hour_index][:temp],
      summary: data[:hourly][hour_index][:weather][0][:main]
    }
  end

end