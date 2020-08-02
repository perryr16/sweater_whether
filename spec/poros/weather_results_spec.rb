require 'rails_helper'

describe "whether results" do
  before :each do 
    location = 'denver,co'
    @weather_results = WeatherResults.new(location)
    @weather_results.create_weather_object
    @weather = Weather.last
  end
  it "returns weather based on long/lat" do

    expect(@weather.city).to eq('Denver')
    expect(@weather.state).to eq('CO')
    expect(@weather.country).to eq('United States')
    expect(@weather.temp.to_i).to_not eq(0) unless @weather.temp = 0
    expect(@weather.high.to_i).to_not eq(0) unless @weather.high = 0
    expect(@weather.low.to_i).to_not eq(0) unless @weather.low = 0
    expect(@weather.feels_like.to_i).to_not eq(0) unless @weather.feels_like = 0
    expect(@weather.temp_units).to eq('F')
    expect(@weather.date.include?(":")).to be true
    expect(@weather.summary.present?).to be true
    expect(@weather.humidity).to_not eq(0) unless @weather.humidity == 0
    expect(@weather.humidity_units).to eq("%")
    expect(@weather.visibility).to_not eq(0)
    expect(@weather.visibility_units).to eq('miles')

    exp_uv_ratings = ['low', 'moderate', 'high', 'very high', 'extreme', 'n/a']
    expect(@weather.uv_index).to eq('n/a') if @weather.uv_index == "n/a"

    expect(exp_uv_ratings.include?(@weather.uv_index_rating)).to be true
    expect(([@weather.sunrise[-2..-1]] & ['AM', 'PM']).present?).to be true
    expect(@weather.sunrise.include?(':')).to be true
    expect(@weather.sunrise[0].to_i).to_not eq(0)
    expect(([@weather.sunset[-2..-1]] & ['AM', 'PM']).present?).to be true
    expect(@weather.sunset.include?(':')).to be true
    expect(@weather.sunset[0].to_i).to_not eq(0)
  end

  it "returns hourly weather" do

    expect(@weather.hourlies.length).to eq(8)
    
    @weather.hourlies.each_with_index do |hourly, index|
      expect(([hourly.name[-2..-1]] & ['AM', 'PM']).present?).to be true
      expect(hourly.name[0].to_i).to_not eq(0)
      expect(hourly.summary.present?).to be true 
      expect(hourly.temp.to_i).to_not eq(0) unless hourly.temp == 0
      expect(hourly.temp_units).to eq('F')
      expect(hourly.index).to eq(index)
    end

  end
    
  it "returns Daily weather forecast" do 

    expect(@weather.dailies.length).to eq(5)

    days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    
    @weather.dailies.each_with_index do |daily, index|
      expect(days_of_week.include?(daily.name)).to be true
      expect(daily.summary.present?).to be true
      expect(daily.precip_units).to eq('mm')
      expect(daily.precip.to_i).to_not eq(0) unless daily.precip = 0
      expect(daily.high.to_i).to_not eq(0) unless daily.high = 0
      expect(daily.low.to_i).to_not eq(0) unless daily.low = 0
      expect(daily.temp_units).to eq('F')
      expect(daily.index).to eq(index)
    end
    
  end  

  it "test format_uvi method" do
    expect(@weather_results.format_uvi(0)).to eq('low')
    expect(@weather_results.format_uvi(3)).to eq('moderate')
    expect(@weather_results.format_uvi(5)).to eq('moderate')
    expect(@weather_results.format_uvi(05)).to eq('moderate')
    expect(@weather_results.format_uvi(7)).to eq('high')
    expect(@weather_results.format_uvi(7)).to eq('high')
    expect(@weather_results.format_uvi(8)).to eq('very high')
    expect(@weather_results.format_uvi(11)).to eq('extreme')
    expect(@weather_results.format_uvi(90)).to eq('extreme')
    expect(@weather_results.format_uvi(100)).to eq('n/a')
    expect(@weather_results.format_uvi(-5)).to eq('n/a')
    expect(@weather_results.format_uvi('dog')).to eq('n/a')
  end

  it "test country" do
    expect(@weather_results.format_country("England")).to eq('England')
    expect(@weather_results.format_country("US")).to eq('United States')
  end
  
  
  
end