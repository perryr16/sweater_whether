require 'rails_helper'

describe "Weather service" do 

  it "returns wather today from lat lon" do
    service = WeatherService.new
    lat = 39.738453
    lon = -104.984853
    body = service.get_weather(lat, lon)
    #current
    expect(body[:current][:temp].class).to be Float
    #high
    expect(body[:daily][0][:temp][:max].class).to be Float
    #low
    expect(body[:daily][0][:temp][:min].class).to be Float
    #date
    expect(body[:current][:dt].class).to be Integer
    #summary
    expect(body[:current][:weather][0][:main].class).to be String
    #feels_like
    expect(body[:current][:feels_like].class).to be Float
    #humidity
    expect(body[:current][:humidity].class).to be Integer
    #visibility
    expect(body[:current][:visibility].class).to be Integer
    #uv index
    expect(body[:current][:uvi].class).to be Float
    #sunrise
    expect(body[:current][:sunrise].class).to be Integer
    #sunset
    expect(body[:current][:sunset].class).to be Integer
  end

  it "returns hourly temp" do
    service = WeatherService.new
    lat = 39.738453
    lon = -104.984853
    body = service.get_weather(lat, lon)

    binding.pry
    
  end
  
  
end