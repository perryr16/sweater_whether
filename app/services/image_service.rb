class ImageService 

  def conn 
    Faraday.new('https://api.unsplash.com')
  end

  def get_image(keyword)
    keyword = keyword.gsub(',','%20').gsub(' ','%20' )
    response = conn.get('/search/photos') do |res|
      res.params[:client_id] = ENV['UNSPLASH_KEY']
      res.params[:query] = keyword 
      res.params[:page] = 1
      res.params[:per_page] = 5

    end    
    JSON.parse(response.body, symbolize_names: true)
  end
  
end