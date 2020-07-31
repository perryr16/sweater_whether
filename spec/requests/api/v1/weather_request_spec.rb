require 'rails_helper'

describe "whether results" do
  before :each do 
    location = 'denver,co'
    weather_results = WeatherResults.new(location)
    
    weather = Weather.new
  end
  xit "returns weather based on long/lat" do


    expect(@weather.city).to eq('Denver')
    expect(@weather.state).to eq('CO')
    expect(@weather.country).to eq('United States')
    expect(@weather.high).to eq('66')
    expect(@weather.low).to eq('31')
    expect(@weather.date).to eq('April 12, 2020')
    expect(@weather.time).to eq('3:22 PM')
    expect(@weather.summary).to eq('Partly Cloudy')
    expect(@weather.feels_like).to eq('54')
    expect(@weather.humidity).to eq('30%')
    expect(@weather.visibility).to eq('20 miles')
    expect(@weather.uv_index).to eq('2(low)')
    expect(@weather.sunrise).to eq('6:23 AM')
    expect(@weather.sunset).to eq('8:20 PM')
  end
  xit "returns hourly weather" do

    expect(@weather.hourly.where(name: "1 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "1 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "2 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "2 AM").summary).to eq('cloudy')

    expect(@weather.hourly.where(name: "3 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "3 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "4 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "4 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "5 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "5 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "6 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "6 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "7 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "7 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "8 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "8 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "9 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "9 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "10 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "10 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "11 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "11 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "12 AM").temp).to eq('54')
    expect(@weather.hourly.where(name: "12 AM").summary).to eq('sunny')

    expect(@weather.hourly.where(name: "1 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "1 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "2 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "2 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "3 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "3 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "4 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "4 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "5 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "5 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "6 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "6 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "7 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "7 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "8 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "8 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "9 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "9 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "10 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "10 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "11 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "11 PM").summary).to eq('54')

    expect(@weather.hourly.where(name: "12 PM").temp).to eq('54')
    expect(@weather.hourly.where(name: "12 PM").summary).to eq('54')
  end
    
  xit "returns Daily weather forcast" do 

    expect(@weather.daily.where(name: 'Sunday').summary).to eq('')
    expect(@weather.daily.where(name: 'Sunday').precip).to eq('0')
    expect(@weather.daily.where(name: 'Sunday').high).to eq('54')
    expect(@weather.daily.where(name: 'Sunday').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Monday').summary).to eq('')
    expect(@weather.daily.where(name: 'Monday').precip).to eq('0')
    expect(@weather.daily.where(name: 'Monday').high).to eq('54')
    expect(@weather.daily.where(name: 'Monday').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Tuesday').summary).to eq('')
    expect(@weather.daily.where(name: 'Tuesday').precip).to eq('0')
    expect(@weather.daily.where(name: 'Tuesday').high).to eq('54')
    expect(@weather.daily.where(name: 'Tuesday').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Wednesday').summary).to eq('')
    expect(@weather.daily.where(name: 'Wednesday').precip).to eq('0')
    expect(@weather.daily.where(name: 'Wednesday').high).to eq('54')
    expect(@weather.daily.where(name: 'Wednesday').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Thursday').summary).to eq('')
    expect(@weather.daily.where(name: 'Thursday').precip).to eq('0')
    expect(@weather.daily.where(name: 'Thursday').high).to eq('54')
    expect(@weather.daily.where(name: 'Thursday').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Friday').summary).to eq('')
    expect(@weather.daily.where(name: 'Friday').precip).to eq('0')
    expect(@weather.daily.where(name: 'Friday').high).to eq('54')
    expect(@weather.daily.where(name: 'Friday').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Saturday').summary).to eq('')
    expect(@weather.daily.where(name: 'Saturday').precip).to eq('0')
    expect(@weather.daily.where(name: 'Saturday').high).to eq('54')
    expect(@weather.daily.where(name: 'Saturday').low).to eq('54')
    #
  end  
  
end