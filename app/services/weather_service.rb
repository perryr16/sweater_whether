class WeatherService 

  def get_weather(lat, lon)
    response = conn.get('/data/2.5/onecall') do |res|
      res.params[:lat] = lat
      res.params[:lon] = lon
      res.params[:exclude] = 'minutely'
      res.params[:units] = 'imperial'
    end
    json_parse(response)
  end

  private 

  def conn 
    Faraday.new('https://api.openweathermap.org') do |res|
      res.params[:appid] = ENV['WEATHER_KEY']
    end
  end

  def json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end



end