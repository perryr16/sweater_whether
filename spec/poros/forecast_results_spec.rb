require 'rails_helper'

describe 'Forcast Results Methods' do
  before :each do 
    location = 'denver,co'
    @forcast_results = ForecastResults.new(location)
  end
  it "test format_uvi method" do
    expect(@forcast_results.format_uvi(0)).to eq('low')
    expect(@forcast_results.format_uvi(3)).to eq('moderate')
    expect(@forcast_results.format_uvi(5)).to eq('moderate')
    expect(@forcast_results.format_uvi(05)).to eq('moderate')
    expect(@forcast_results.format_uvi(7)).to eq('high')
    expect(@forcast_results.format_uvi(7)).to eq('high')
    expect(@forcast_results.format_uvi(8)).to eq('very high')
    expect(@forcast_results.format_uvi(11)).to eq('extreme')
    expect(@forcast_results.format_uvi(90)).to eq('extreme')
    expect(@forcast_results.format_uvi(100)).to eq('n/a')
    expect(@forcast_results.format_uvi(-5)).to eq('n/a')
    expect(@forcast_results.format_uvi('dog')).to eq('n/a')
  end

  it "test country" do
    expect(@forcast_results.format_country("England")).to eq('England')
    expect(@forcast_results.format_country("US")).to eq('United States')
  end
end