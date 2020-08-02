class WeatherResults 

  def initialize(location)
    @location = location
    @map_data = MapService.new.get_lat_lon(@location)
    @weather_data = WeatherService.new.get_weather(lat_lon[:lat], lat_lon[:lng])
  end

  def lat_lon  
    @map_data[:results][0][:locations][0][:latLng]
  end

  def create_weather_object
    weather = Weather.create(new_weather_params)
    create_hourlies(weather)
    create_dailies(weather)
    weather
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

  def format_uvi(uvi)
    case uvi 
    when 0..2.9
      "low"
    when 2.9..5.9
      "moderate"
    when 5.9..7.9
      "high"
    when 7.9..10.9
      "very high"
    when 10.9..99
      "extreme"
    else 
      "n/a"
    end
  end

  def format_country(abbrev)
    if abbrev == 'US'
      'United States'
    else
      abbrev 
    end
  end


  private

  def new_weather_params 
    {
      city:               @map_data[:results][0][:locations][0][:adminArea5],
      state:              @map_data[:results][0][:locations][0][:adminArea3],
      country:            format_country(@map_data[:results][0][:locations][0][:adminArea1]), 
      temp:               @weather_data[:current][:temp],
      high:               @weather_data[:daily][0][:temp][:max],
      low:                @weather_data[:daily][0][:temp][:min],
      feels_like:         @weather_data[:current][:feels_like],
      temp_units:         "F",
      date:               format_datetime,
      summary:            @weather_data[:current][:weather][0][:description],
      humidity:           @weather_data[:current][:humidity],
      humidity_units:     "%",
      visibility:         meter_to_mile(@weather_data[:current][:visibility]),
      visibility_units:   "miles",
      uv_index:           @weather_data[:current][:uvi],
      uv_index_rating:    format_uvi(@weather_data[:current][:uvi]),
      sunrise:            format_hr_min(@weather_data[:current][:sunrise]),
      sunset:             format_hr_min(@weather_data[:current][:sunset]),
    }
  end

  def new_hourly_params(index)
    {
    name: format_hr(@weather_data[:hourly][index][:dt]),
    summary: @weather_data[:hourly][index][:weather][0][:main],
    temp: @weather_data[:hourly][index][:temp],
    temp_units: "F",
    index: index
    }
  end

  def new_daily_params(index)
    {    
     name: format_day(@weather_data[:daily][index][:dt]),
     summary: @weather_data[:daily][index][:weather][0][:main],
     precip: format_precip(@weather_data[:daily][index]),
     precip_units: "mm",
     high: @weather_data[:daily][index][:temp][:max],
     low: @weather_data[:daily][index][:temp][:min],
     temp_units: "F",
     index: index
    }
  end

  def format_datetime
    date = Time.at(@weather_data[:current][:dt]).strftime("%I:%M %p, %B %d")
    date.slice!(0) if date[0] == '0'
    date.slice!(-2) if date[-2] == '0'
    date
  end

  def format_hr(ux_time)
    time = Time.at(ux_time).strftime("%I %p")
    time.slice!(0) if time[0] == '0'
    time
  end

  def format_hr_min(ux_time)
    time = Time.at(ux_time).strftime("%I:%M %p")
    time.slice!(0) if time[0] == '0'
    time
  end

  def format_day(ux_time)
    Time.at(ux_time).strftime("%A")
  end

  def meter_to_mile(meters)
    (meters.to_f / 1609.34).to_s
  end

  def format_precip(daily)
    return daily[:rain] if daily[:rain]
    return daily[:snow] if daily[:snow]
    '0'
  end

end