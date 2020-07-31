require 'rails_helper'

describe "whether service" do 
  xit "returns weather based on long/lat" do
    service = WeatherService.new 
    results = WeatherResults.new
    weather = Weather.new

    expect(weather.city).to eq('Denver')
    expect(weather.state).to eq('CO')
    expect(weather.country).to eq('United States')
    expect(weather.high).to eq('66')
    expect(weather.low).to eq('31')
    expect(weather.date).to eq('April 12, 2020')
    expect(weather.time).to eq('3:22 PM')
    expect(weather.summary).to eq('Partly Cloudy')
    expect(weather.feels_like).to eq('54')
    expect(weather.humidity).to eq('30%')
    expect(weather.visibility).to eq('20 miles')
    expect(weather.uv_index).to eq('2(low)')
    expect(weather.sunrise).to eq('6:23 AM')
    expect(weather.sunset).to eq('8:20 PM')
    expect(weather.am_1.temp).to eq('54')
    expect(weather.am_2.temp).to eq('54')
    expect(weather.am_3.temp).to eq('54')
    expect(weather.am_4.temp).to eq('54')
    expect(weather.am_5.temp).to eq('54')
    expect(weather.am_6.temp).to eq('54')
    expect(weather.am_7.temp).to eq('54')
    expect(weather.am_8.temp).to eq('54')
    expect(weather.am_9.temp).to eq('54')
    expect(weather.am_10.temp).to eq('54')
    expect(weather.am_11.temp).to eq('54')
    expect(weather.am_12.temp).to eq('54')
    expect(weather.am_1.summary).to eq('sunny')
    expect(weather.am_2.summary).to eq('cloudy')
    expect(weather.am_3.summary).to eq('sunny')
    expect(weather.am_4.summary).to eq('sunny')
    expect(weather.am_5.summary).to eq('sunny')
    expect(weather.am_6.summary).to eq('sunny')
    expect(weather.am_7.summary).to eq('sunny')
    expect(weather.am_8.summary).to eq('sunny')
    expect(weather.am_9.summary).to eq('sunny')
    expect(weather.am_10.summary).to eq('sunny')
    expect(weather.am_11.summary).to eq('sunny')
    expect(weather.am_12.summary).to eq('sunny')
    expect(weather.pm_1.temp).to eq('54')
    expect(weather.pm_2.temp).to eq('54')
    expect(weather.pm_3.temp).to eq('54')
    expect(weather.pm_4.temp).to eq('54')
    expect(weather.pm_5.temp).to eq('54')
    expect(weather.pm_6.temp).to eq('54')
    expect(weather.pm_7.temp).to eq('54')
    expect(weather.pm_8.temp).to eq('54')
    expect(weather.pm_9.temp).to eq('54')
    expect(weather.pm_10.temp).to eq('54')
    expect(weather.pm_11.temp).to eq('54')
    expect(weather.pm_12.temp).to eq('54')
    expect(weather.pm_1.summary).to eq('54')
    expect(weather.pm_2.summary).to eq('54')
    expect(weather.pm_3.summary).to eq('54')
    expect(weather.pm_4.summary).to eq('54')
    expect(weather.pm_5.summary).to eq('54')
    expect(weather.pm_6.summary).to eq('54')
    expect(weather.pm_7.summary).to eq('54')
    expect(weather.pm_8.summary).to eq('54')
    expect(weather.pm_9.summary).to eq('54')
    expect(weather.pm_10.summary).to eq('54')
    expect(weather.pm_11.summary).to eq('54')
    expect(weather.pm_12.summary).to eq('54')\
    
    expect(weather.sund.summary).to eq('')
    expect(weather.sund.precip).to eq('0')
    expect(weather.sund.high).to eq('54')
    expect(weather.sund.low).to eq('54')
    #
    expect(weather.mon.summary).to eq('')
    expect(weather.mon.precip).to eq('0')
    expect(weather.mon.high).to eq('54')
    expect(weather.mon.low).to eq('54')
    #
    expect(weather.tues.summary).to eq('')
    expect(weather.tues.precip).to eq('0')
    expect(weather.tues.high).to eq('54')
    expect(weather.tues.low).to eq('54')
    #
    expect(weather.tues.summary).to eq('')
    expect(weather.tues.precip).to eq('0')
    expect(weather.tues.high).to eq('54')
    expect(weather.tues.low).to eq('54')
    #
    expect(weather.wed.summary).to eq('')
    expect(weather.wed.precip).to eq('0')
    expect(weather.wed.high).to eq('54')
    expect(weather.wed.low).to eq('54')
    #
    expect(weather.thurs.summary).to eq('')
    expect(weather.thurs.precip).to eq('0')
    expect(weather.thurs.high).to eq('54')
    expect(weather.thurs.low).to eq('54')
    #
    expect(weather.fri.summary).to eq('')
    expect(weather.fri.precip).to eq('0')
    expect(weather.fri.high).to eq('54')
    expect(weather.fri.low).to eq('54')
    #
    expect(weather.sat.summary).to eq('')
    expect(weather.sat.precip).to eq('0')
    expect(weather.sat.high).to eq('54')
    expect(weather.sat.low).to eq('54')
    #




  end
  
  
end