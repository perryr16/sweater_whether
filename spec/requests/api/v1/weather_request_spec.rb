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

    expect(@weather.daily.where(name: 'Today').summary).to eq('')
    expect(@weather.daily.where(name: 'Today').precip).to eq('0')
    expect(@weather.daily.where(name: 'Today').high).to eq('54')
    expect(@weather.daily.where(name: 'Today').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Tomorrow').summary).to eq('')
    expect(@weather.daily.where(name: 'Tomorrow').precip).to eq('0')
    expect(@weather.daily.where(name: 'Tomorrow').high).to eq('54')
    expect(@weather.daily.where(name: 'Tomorrow').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Day 3').summary).to eq('')
    expect(@weather.daily.where(name: 'Day 3').precip).to eq('0')
    expect(@weather.daily.where(name: 'Day 3').high).to eq('54')
    expect(@weather.daily.where(name: 'Day 3').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Day 4').summary).to eq('')
    expect(@weather.daily.where(name: 'Day 4').precip).to eq('0')
    expect(@weather.daily.where(name: 'Day 4').high).to eq('54')
    expect(@weather.daily.where(name: 'Day 4').low).to eq('54')
    #
    expect(@weather.daily.where(name: 'Day 5').summary).to eq('')
    expect(@weather.daily.where(name: 'Day 5').precip).to eq('0')
    expect(@weather.daily.where(name: 'Day 5').high).to eq('54')
    expect(@weather.daily.where(name: 'Day 5').low).to eq('54')
    #
  end  
  
end