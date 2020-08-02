require 'rails_helper'

describe "Weather service" do 

  it "returns wather today from lat lon" do
    service = WeatherService.new
    lat = 39.738453
    lon = -104.984853 
    body = service.get_weather(lat, lon)
    #current
    expect(body[:current][:temp].is_a?(Numeric)).to be true
    #high
    expect(body[:daily][0][:temp][:max].is_a?(Numeric)).to be true
    #low
    expect(body[:daily][0][:temp][:min].is_a?(Numeric)).to be true
    #date
    expect(body[:current][:dt].is_a?(Numeric)).to be true
    #summary
    expect(body[:current][:weather][0][:description].class).to be String
    #feels_like
    expect(body[:current][:feels_like].is_a?(Numeric)).to be true
    #humidity
    expect(body[:current][:humidity].is_a?(Numeric)).to be true
    #visibility
    expect(body[:current][:visibility].is_a?(Numeric)).to be true
    #uv index
    expect(body[:current][:uvi].is_a?(Numeric)).to be true
    #sunrise
    expect(body[:current][:sunrise].is_a?(Numeric)).to be true
    #sunset
    expect(body[:current][:sunset].is_a?(Numeric)).to be true
  end

  it "returns hourly temp for today" do
    service = WeatherService.new
    lat = 39.738453
    lon = -104.984853
    body = service.get_weather(lat, lon)

    8.times do |index|
      expect(body[:hourly][index][:dt].is_a?(Numeric)).to be true
      expect(body[:hourly][index][:temp].is_a?(Numeric)).to be true
      expect(body[:hourly][index][:weather][0][:main].class).to be String
    end
  
  end

  it "returns daily weather for today and 4 days out" do
    service = WeatherService.new
    lat = 39.738453
    lon = -104.984853
    body = service.get_weather(lat, lon)
    
    5.times do |index|
      expect(body[:daily][index][:dt].is_a?(Numeric)).to be true
      expect(body[:daily][index][:rain].is_a?(Numeric)).to be true if body[:daily][index][:rain]
      expect(body[:daily][index][:temp][:max].is_a?(Numeric)).to be true
      expect(body[:daily][index][:temp][:min].is_a?(Numeric)).to be true
      expect(body[:daily][index][:weather][0][:main].class).to be String
    end
  end
  
  
  
end