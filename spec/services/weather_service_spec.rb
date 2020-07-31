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
    
    # now: name, temp, summary
    expect(body[:hourly][0][:dt].is_a?(Numeric)).to be true
    expect(body[:hourly][0][:temp].is_a?(Numeric)).to be true
    expect(body[:hourly][0][:weather][0][:main].class).to be String
    # +1 : name, temp, summary
    expect(body[:hourly][1][:dt].is_a?(Numeric)).to be true
    expect(body[:hourly][1][:temp].is_a?(Numeric)).to be true
    expect(body[:hourly][1][:weather][0][:main].class).to be String
    # +2 : name, temp, summary
    expect(body[:hourly][2][:dt].is_a?(Numeric)).to be true
    expect(body[:hourly][2][:temp].is_a?(Numeric)).to be true
    expect(body[:hourly][2][:weather][0][:main].class).to be String
    # +3 : name, temp, summary
    expect(body[:hourly][3][:dt].is_a?(Numeric)).to be true
    expect(body[:hourly][3][:temp].is_a?(Numeric)).to be true
    expect(body[:hourly][3][:weather][0][:main].class).to be String
    # +4 : name, temp, summary
    expect(body[:hourly][4][:dt].is_a?(Numeric)).to be true
    expect(body[:hourly][4][:temp].is_a?(Numeric)).to be true
    expect(body[:hourly][4][:weather][0][:main].class).to be String
    # +5 : name, temp, summary
    expect(body[:hourly][5][:dt].is_a?(Numeric)).to be true
    expect(body[:hourly][5][:temp].is_a?(Numeric)).to be true
    expect(body[:hourly][5][:weather][0][:main].class).to be String
    # +6 : name, temp, summary
    expect(body[:hourly][6][:dt].is_a?(Numeric)).to be true
    expect(body[:hourly][6][:temp].is_a?(Numeric)).to be true
    expect(body[:hourly][6][:weather][0][:main].class).to be String
    # +7 : name, temp, summary
    expect(body[:hourly][7][:dt].is_a?(Numeric)).to be true
    expect(body[:hourly][7][:temp].is_a?(Numeric)).to be true
    expect(body[:hourly][7][:weather][0][:main].class).to be String
  end

  it "returns daily weather for today and 4 days out" do
    service = WeatherService.new
    lat = 39.738453
    lon = -104.984853
    body = service.get_weather(lat, lon)

    # today: name, summary, precip, high, low
    expect(body[:daily][0][:dt].is_a?(Numeric)).to be true
    expect(body[:daily][0][:rain].is_a?(Numeric)).to be true
    expect(body[:daily][0][:temp][:max].is_a?(Numeric)).to be true
    expect(body[:daily][0][:temp][:min].is_a?(Numeric)).to be true
    expect(body[:daily][0][:weather][0][:main].class).to be String
    # +1: name, precip, high, low, summary
    expect(body[:daily][1][:dt].is_a?(Numeric)).to be true
    expect(body[:daily][1][:rain].is_a?(Numeric)).to be true
    expect(body[:daily][1][:temp][:max].is_a?(Numeric)).to be true
    expect(body[:daily][1][:temp][:min].is_a?(Numeric)).to be true
    expect(body[:daily][1][:weather][0][:main].class).to be String
    # +2: name, precip, high, low, summary
    expect(body[:daily][2][:dt].is_a?(Numeric)).to be true
    expect(body[:daily][2][:rain].is_a?(Numeric)).to be true
    expect(body[:daily][2][:temp][:max].is_a?(Numeric)).to be true
    expect(body[:daily][2][:temp][:min].is_a?(Numeric)).to be true
    expect(body[:daily][2][:weather][0][:main].class).to be String
    # +3: name, precip, high, low, summary
    expect(body[:daily][3][:dt].is_a?(Numeric)).to be true
    expect(body[:daily][3][:rain].is_a?(Numeric)).to be true
    expect(body[:daily][3][:temp][:max].is_a?(Numeric)).to be true
    expect(body[:daily][3][:temp][:min].is_a?(Numeric)).to be true
    expect(body[:daily][3][:weather][0][:main].class).to be String 
    # +4: name, precip, high, low, summary
    expect(body[:daily][4][:dt].is_a?(Numeric)).to be true
    expect(body[:daily][4][:rain].is_a?(Numeric)).to be true
    expect(body[:daily][4][:temp][:max].is_a?(Numeric)).to be true
    expect(body[:daily][4][:temp][:min].is_a?(Numeric)).to be true
    expect(body[:daily][4][:weather][0][:main].class).to be String
    
  end
  
  
  
end