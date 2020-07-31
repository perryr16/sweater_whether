class MapService 

  def get_long_lat(location)
    response = conn.get('/geocoding/v1/address') do |res|
      res.params[:location] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def conn 
    Faraday.new('http://www.mapquestapi.com') do |res|
      res.params[:key] = ENV['MAP_KEY']
    end
  end
end