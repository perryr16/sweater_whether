require 'rails_helper'

describe "Weather service" do 

  it "returns wather today from lat lon" do
    service = TrailService.new
    lat = 39.738453
    lon = -104.984853 
    body = service.get_trails(lat, lon)

    expect(body[:trails].class).to be Array
    expect(body[:trails][0][:name].present?).to be true
    expect(body[:trails][0][:summary].present?).to be true
    expect(body[:trails][0][:difficulty].present?).to be true
    expect(body[:trails][0][:location].present?).to be true
  end
end
