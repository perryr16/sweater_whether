class WeatherResults 

  def initialize(location)
    @location = location
    @map_data = MapService.new.get_lat_lon(@location)
    @weather_data = WeatherService.new.get_weather(lat_lon[:lat], lat_lon[:lng])
  end

  def lat_lon  
    @map_data[:results][0][:locations][0][:latLng]
  end

  def weather_data 
    weather_service.get_weather(lat_lon[:lat], lat_lon[:lng])
  end

  def create_weather_object
    weather = Weather.create(new_weather_params)
    create_hourlies(weather)
    create_dailies(weather)
  end

  def create_hourlies(weather)
    8.times do |index|
      weather.hourlies.create(new_hourly_params(index))
    end
  end

  def create_dailies(weather)
    5.times do |index|
      weather.dailies.create(new_daily_params(index))
    end
  end


  private

  def new_weather_params 
    {
      city:       @map_data[:results][0][:locations][0][:adminArea5],
      state:      @map_data[:results][0][:locations][0][:adminArea3],
      country:    format_country(@map_data[:results][0][:locations][0][:adminArea1]), 
      temp:       @weather_data[:current][:temp].to_i,
      high:       @weather_data[:daily][0][:temp][:max].to_i,
      low:        @weather_data[:daily][0][:temp][:min].to_i,
      feels_like: @weather_data[:current][:feels_like].to_i,
      date:       format_datetime,
      summary:    @weather_data[:current][:weather][0][:description],
      humidity:   "#{@weather_data[:current][:humidity]}%",
      visibility: meter_to_mile(@weather_data[:current][:visibility]),
      uv_index:   format_uvi(@weather_data[:current][:uvi]),
      sunrise:    format_hr_min(@weather_data[:current][:sunrise]),
      sunset:     format_hr_min(@weather_data[:current][:sunset]),
    }
  end

  def new_hourly_params(index)
    {
    name: format_hr(@weather_data[:hourly][index][:dt]),
    summary: @weather_data[:hourly][index][:weather][0][:main],
    temp: @weather_data[:hourly][index][:temp].to_i,
    index: index,
    }
  end

  def new_daily_params(index)
    {    
     name: format_day(@weather_data[:daily][index][:dt]),
     summary: @weather_data[:daily][index][:weather][0][:main],
     precip: "#{@weather_data[:daily][index][:rain].to_i} mm",
     high: @weather_data[:daily][index][:temp][:max].to_i,
     low: @weather_data[:daily][index][:temp][:min].to_i,
     index: index
    }
  end

  def format_datetime
    date = Time.at(@weather_data[:current][:dt]).strftime("%H:%M %p, %B %d")
    date.slice!(0) if date[0] == '0'
    date.slice!(-2) if date[-2] == '0'
    date
  end

  def format_hr(ux_time)
    time = Time.at(ux_time).strftime("%H %p")
    time.slice!(0) if time[0] == '0'
    time
  end

  def format_hr_min(ux_time)
    time = Time.at(ux_time).strftime("%H:%M %p")
    time.slice!(0) if time[0] == '0'
    time
  end

  def format_day(ux_time)
    Time.at(ux_time).strftime("%A")
  end

  def format_country(abbrev)
    if abbrev == 'US'
      'United States'
    else
      abbrev 
    end
  end

  def meter_to_mile(meters)
    ((meters.to_i / 1609.34).to_i).to_s + " miles"
  end

  def format_uvi(uvi)
    case uvi 
    when 0..2
      "#{uvi} (low)"
    when 3..5
      "#{uvi} (moderate)"
    when 6..7
      "#{uvi} (high)"
    when 8..10 
      "#{uvi} (very high)"
    when 11..99
      "#{uvi} (extreme)"
    end
  end
  
end