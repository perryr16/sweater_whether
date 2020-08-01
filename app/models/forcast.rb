class Forcast 

  def initialize(params)
    @location = nil if !params[:location]
    @location = params[:location] if params[:location]
  end
  

  def weather
    WeatherResults.new(@location).create_weather_object
  end

  def format_response
    return location_missing if !@location
    location_included
  end

  def location_included
    {
      forcast: weather, 
      hourly: weather.hourlies, 
      daily: weather.dailies
    }
  end

  def location_missing 
    {message: "Enter a location. api/v1/forcast?location=<city,state>"}
  end
  
end