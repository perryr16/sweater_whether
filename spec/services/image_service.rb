require 'rails_helper'

describe "Image service" do 

  xit "returns image from location" do
    service = ImageService.new
    location = 'denver,co'
    body = service.get_image(location)
    
    binding.pry

    # expect(body.keys[0].is_a?(Symbol)).to be true
    # lat = body[:results][0][:locations][0][:latLng][:lat]
    # lon = body[:results][0][:locations][0][:latLng][:lng]
    # expect(lat.is_a?(Float)).to be true
    # expect(lon.is_a?(Float)).to be true
    # lat: 39.738453
    # long: -104.984853
  end
  
end