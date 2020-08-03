require 'rails_helper'

describe "Trail Service" do 

  it "returns trail info from lat lon" do
    service = TrailService.new
    lat = 39.738453
    lon = -104.984853 
    body = service.get_trails(lat, lon)

    expect(body[:trails].class).to be Array
    expect(body[:trails][0][:name].present?).to be true
    expect(body[:trails][0][:summary].present?).to be true
    expect(body[:trails][0][:difficulty].present?).to be true
    expect(body[:trails][0][:location].present?).to be true
    expect(body[:trails][0][:not_a_value].present?).to be false
  end
end
