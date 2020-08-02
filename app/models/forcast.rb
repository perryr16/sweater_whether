class Forcast 

  def initialize(params)
    @location = params[:location]
  end
  
  def weather
    WeatherResults.new(@location).create_weather_object
  end

  def format_response
    {
      forcast: weather, 
      hourly: weather.hourlies, 
      daily: weather.dailies
    }
  end
  
end