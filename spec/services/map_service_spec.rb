require 'rails_helper'

describe "Map service" do 

  it "returns data from location" do
    service = MapService.new
    location = 'denver,co'
    body = service.get_lat_lon(location)

    expect(body.keys[0].is_a?(Symbol)).to be true
    lat = body[:results][0][:locations][0][:latLng][:lat]
    lon = body[:results][0][:locations][0][:latLng][:lng]
    expect(lat.is_a?(Float)).to be true
    expect(lon.is_a?(Float)).to be true
  end
  
end