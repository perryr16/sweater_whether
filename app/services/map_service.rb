class MapService 

  def get_lat_lon(location)
    response = conn.get('/geocoding/v1/address') do |res|
      res.params[:location] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_directions(to, from)
    response = conn.get('/directions/v2/route') do |res|
      res.params[:to] = to
      res.params[:from] = from
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