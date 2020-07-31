require 'rails_helper'

describe "whether results" do
  before :each do 
    location = 'denver,co'
    weather_results = WeatherResults.new(location)
    weather_results.create_weather_object
  end
  it "returns weather based on long/lat" do


    expect(@weather.city).to eq('Denver')
    expect(@weather.state).to eq('CO')
    expect(@weather.country).to eq('United States')
    expect(@weather.current).to eq('66')
    expect(@weather.high).to eq('66')
    expect(@weather.low).to eq('31')
    expect(@weather.date).to eq('April 12, 2020')
    expect(@weather.time).to eq('3:22 PM')
    expect(@weather.summary).to eq('Partly Cloudy')
    expect(@weather.feels_like).to eq('54')
    expect(@weather.humidity).to eq('30%')
    expect(@weather.visibility).to eq('20 miles') #???
    #
    expect(@weather.uv_index).to eq('2(low)') # UV index
    expect(@weather.sunrise).to eq('6:23 AM') # hourly
    expect(@weather.sunset).to eq('8:20 PM') # hourly
  end
  xit "returns hourly weather" do

    expect(@weather.hourly.where(index: 0).temp).to eq('54')
    expect(@weather.hourly.where(index: 0).summary).to eq('sunny')

    expect(@weather.hourly.where(index: 1).temp).to eq('54')
    expect(@weather.hourly.where(index: 1).summary).to eq('cloudy')

    expect(@weather.hourly.where(index: 2).temp).to eq('54')
    expect(@weather.hourly.where(index: 2).summary).to eq('sunny')

    expect(@weather.hourly.where(index: 3).temp).to eq('54')
    expect(@weather.hourly.where(index: 3).summary).to eq('sunny')

    expect(@weather.hourly.where(index: 4).temp).to eq('54')
    expect(@weather.hourly.where(index: 4).summary).to eq('sunny')

    expect(@weather.hourly.where(index: 5).temp).to eq('54')
    expect(@weather.hourly.where(index: 5).summary).to eq('sunny')

    expect(@weather.hourly.where(index: 6).temp).to eq('54')
    expect(@weather.hourly.where(index: 6).summary).to eq('sunny')

    expect(@weather.hourly.where(index: 7).temp).to eq('54')
    expect(@weather.hourly.where(index: 7).summary).to eq('sunny')

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