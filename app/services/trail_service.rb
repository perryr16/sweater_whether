class TrailService 

  def get_trails(lat, lon)
    response = conn.get('/data/get-trails') do |res|
      res.params[:lat] = lat
      res.params[:lon] = lon
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def conn 
    Faraday.new('https://www.hikingproject.com') do |res|
      res.params[:key] = ENV['TRAIL_KEY']
    end
  end
end