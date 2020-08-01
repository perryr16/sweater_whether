require 'rails_helper'

describe "whether results" do
  before :each do 
    location = 'denver,co'
    weather_results = WeatherResults.new(location)
    weather_results.create_weather_object
    @weather = Weather.last
  end
  it "returns weather based on long/lat" do

    expect(@weather.city).to eq('Denver')
    expect(@weather.state).to eq('CO')
    expect(@weather.country).to eq('United States')
    expect(@weather.temp.to_i).to_not eq(0)
    expect(@weather.high.to_i).to_not eq(0)
    expect(@weather.low.to_i).to_not eq(0)
    expect(@weather.feels_like.to_i).to_not eq(0)
    expect(@weather.date.include?(":")).to be true
    expect(@weather.summary.present?).to be true
    expect(@weather.humidity[0..-2].to_i).to_not eq(0)
    expect(@weather.humidity.include?("%")).to be
    expect(@weather.visibility[0..-7].to_i).to_not eq(0)
    expect(@weather.visibility.include?('miles')).to be true

    exp_uv_ratings = ['low', 'moderate', 'high', 'very high', 'extreme']
    act_uv_rating = @weather.uv_index.split('(')[1][0..-2]

    expect(exp_uv_ratings.include?(act_uv_rating)).to be true 
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
    
  xit "returns Daily weather forcast" do 

    expect(@weather.daily.where(index: 0).summary).to eq('')
    expect(@weather.daily.where(index: 0).precip).to eq('0')
    expect(@weather.daily.where(index: 0).high).to eq('54')
    expect(@weather.daily.where(index: 0).low).to eq('54')
    #
    expect(@weather.daily.where(index: 1).summary).to eq('')
    expect(@weather.daily.where(index: 1).precip).to eq('0')
    expect(@weather.daily.where(index: 1).high).to eq('54')
    expect(@weather.daily.where(index: 1).low).to eq('54')
    #
    expect(@weather.daily.where(index: 2).summary).to eq('')
    expect(@weather.daily.where(index: 2).precip).to eq('0')
    expect(@weather.daily.where(index: 2).high).to eq('54')
    expect(@weather.daily.where(index: 2).low).to eq('54')
    #
    expect(@weather.daily.where(index: 3).summary).to eq('')
    expect(@weather.daily.where(index: 3).precip).to eq('0')
    expect(@weather.daily.where(index: 3).high).to eq('53')
    expect(@weather.daily.where(index: 3).low).to eq('54')
    #
    expect(@weather.daily.where(index: 4).summary).to eq('')
    expect(@weather.daily.where(index: 4).precip).to eq('0')
    expect(@weather.daily.where(index: 4).high).to eq('54')
    expect(@weather.daily.where(index: 4).low).to eq('54')
    #
  end  
  
end