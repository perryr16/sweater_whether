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
    expect(body[:current][:weather][0][:description].class).to be String
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

  it "returns hourly temp for today" do
    service = WeatherService.new
    lat = 39.738453
    lon = -104.984853
    body = service.get_weather(lat, lon)
    
    # now: name, temp, summary
    expect(body[:hourly][0][:dt].class).to be Integer
    expect(body[:hourly][0][:temp].class).to be Float
    expect(body[:hourly][0][:weather][0][:main].class).to be String
    # +1 : name, temp, summary
    expect(body[:hourly][1][:dt].class).to be Integer
    expect(body[:hourly][1][:temp].class).to be Float
    expect(body[:hourly][1][:weather][0][:main].class).to be String
    # +2 : name, temp, summary
    expect(body[:hourly][2][:dt].class).to be Integer
    expect(body[:hourly][2][:temp].class).to be Float
    expect(body[:hourly][2][:weather][0][:main].class).to be String
    # +3 : name, temp, summary
    expect(body[:hourly][3][:dt].class).to be Integer
    expect(body[:hourly][3][:temp].class).to be Float
    expect(body[:hourly][3][:weather][0][:main].class).to be String
    # +4 : name, temp, summary
    expect(body[:hourly][4][:dt].class).to be Integer
    expect(body[:hourly][4][:temp].class).to be Float
    expect(body[:hourly][4][:weather][0][:main].class).to be String
    # +5 : name, temp, summary
    expect(body[:hourly][5][:dt].class).to be Integer
    expect(body[:hourly][5][:temp].class).to be Float
    expect(body[:hourly][5][:weather][0][:main].class).to be String
    # +6 : name, temp, summary
    expect(body[:hourly][6][:dt].class).to be Integer
    expect(body[:hourly][6][:temp].class).to be Float
    expect(body[:hourly][6][:weather][0][:main].class).to be String
    # +7 : name, temp, summary
    expect(body[:hourly][7][:dt].class).to be Integer
    expect(body[:hourly][7][:temp].class).to be Float
    expect(body[:hourly][7][:weather][0][:main].class).to be String
  end

  it "returns daily weather for today and 4 days out" do
    service = WeatherService.new
    lat = 39.738453
    lon = -104.984853
    body = service.get_weather(lat, lon)

    # today: name, summary, precip, high, low
    expect(body[:daily][0][:dt].class).to be Integer
    expect(body[:daily][0][:rain].class).to be Float
    expect(body[:daily][0][:temp][:max].class).to be Float
    expect(body[:daily][0][:temp][:min].class).to be Float
    expect(body[:daily][0][:weather][0][:main].class).to be String
    # +1: name, precip, high, low, summary
    expect(body[:daily][1][:dt].class).to be Integer
    expect(body[:daily][1][:rain].class).to be Float
    expect(body[:daily][1][:temp][:max].class).to be Float
    expect(body[:daily][1][:temp][:min].class).to be Float
    expect(body[:daily][1][:weather][0][:main].class).to be String
    # +2: name, precip, high, low, summary
    expect(body[:daily][2][:dt].class).to be Integer
    expect(body[:daily][2][:rain].class).to be Float
    expect(body[:daily][2][:temp][:max].class).to be Float
    expect(body[:daily][2][:temp][:min].class).to be Float
    expect(body[:daily][2][:weather][0][:main].class).to be String
    # +3: name, precip, high, low, summary
    expect(body[:daily][3][:dt].class).to be Integer
    expect(body[:daily][3][:rain].class).to be Float
    expect(body[:daily][3][:temp][:max].class).to be Float
    expect(body[:daily][3][:temp][:min].class).to be Float
    expect(body[:daily][3][:weather][0][:main].class).to be String 
    # +4: name, precip, high, low, summary
    expect(body[:daily][4][:dt].class).to be Integer
    expect(body[:daily][4][:rain].class).to be Float
    expect(body[:daily][4][:temp][:max].class).to be Float
    expect(body[:daily][4][:temp][:min].class).to be Float
    expect(body[:daily][4][:weather][0][:main].class).to be String
    
  end
  
  
  
end