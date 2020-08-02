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
    expect(@weather.temp.to_i).to_not eq(0) unless @weather.temp = '0'
    expect(@weather.high.to_i).to_not eq(0) unless @weather.high = '0'
    expect(@weather.low.to_i).to_not eq(0) unless @weather.low = '0'
    expect(@weather.feels_like.to_i).to_not eq(0) unless @weather.feels_like = '0'
    expect(@weather.date.include?(":")).to be true
    expect(@weather.summary.present?).to be true
    expect(@weather.humidity[0..-2].to_i).to_not eq(0)
    expect(@weather.humidity.include?("%")).to be
    expect(@weather.visibility[0..-7].to_i).to_not eq(0)
    expect(@weather.visibility.include?('miles')).to be true

    exp_uv_ratings = ['low', 'moderate', 'high', 'very high', 'extreme']
    expect(@weather.uv_index).to eq('n/a') if @weather.uv_index == "n/a"
    act_uv_rating = @weather.uv_index.split('(')[1][0..-2] if !@weather.uv_index == "n/a"

    expect(exp_uv_ratings.include?(act_uv_rating)).to be true if !@weather.uv_index == "n/a"
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
      expect(hourly.temp.to_i).to_not eq(0) unless hourly.temp == '0' 
      expect(hourly.index).to eq(index)
    end

  end
    
  it "returns Daily weather forcast" do 

    expect(@weather.dailies.length).to eq(5)

    days_of_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    
    @weather.dailies.each_with_index do |daily, index|
      expect(days_of_week.include?(daily.name)).to be true
      expect(daily.summary.present?).to be true
      expect(daily.precip.include?('mm')).to be true
      expect(daily.precip[0].to_i).to_not eq(0) unless daily.precip[0] = '0'
      expect(daily.high.to_i).to_not eq(0) unless daily.precip[0] = '0'
      expect(daily.low.to_i).to_not eq(0) unless daily.precip[0] = '0'
      expect(daily.index).to eq(index)
    end
    
  end  

  it "test format_uvi method" do
    expect(@weather_results.format_uvi(0)).to eq('0 (low)')
    expect(@weather_results.format_uvi(3)).to eq('3 (moderate)')
    expect(@weather_results.format_uvi(5)).to eq('5 (moderate)')
    expect(@weather_results.format_uvi(05)).to eq('5 (moderate)')
    expect(@weather_results.format_uvi(7)).to eq('7 (high)')
    expect(@weather_results.format_uvi(7)).to eq('7 (high)')
    expect(@weather_results.format_uvi(8)).to eq('8 (very high)')
    expect(@weather_results.format_uvi(11)).to eq('11 (extreme)')
    expect(@weather_results.format_uvi(90)).to eq('90 (extreme)')
    expect(@weather_results.format_uvi(100)).to eq('n/a')
    expect(@weather_results.format_uvi(-5)).to eq('n/a')
    expect(@weather_results.format_uvi('dog')).to eq('n/a')
  end

  it "test country" do
    expect(@weather_results.format_country("England")).to eq('England')
    expect(@weather_results.format_country("US")).to eq('United States')
  end
  
  
  
end