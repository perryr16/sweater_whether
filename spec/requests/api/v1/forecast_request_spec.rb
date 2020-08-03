require 'rails_helper'

describe "Weather API" do 

  it "sends weather info for a location" do 
    get '/api/v1/forecast?location=denver,co'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body.keys).to eq([:forecast, :hourly, :daily])
    exp_keys = [:city, :state, :country, :temp, :high, :low, :feels_like, :temp_units, :date, :summary, :humidity, :humidity_units, :visibility, :visibility_units, :uv_index, :uv_index_rating, :sunrise, :sunset]
    expect(body[:forecast].keys).to eq(exp_keys)
    body[:forecast].each do |key, value|
      expect(value.present?).to be true
    end

    exp_keys = [:name, :summary, :temp, :temp_units, :index]
    expect(body[:hourly].length).to eq(8)
    body[:hourly].each do |hour|
      expect(hour.keys).to eq(exp_keys)
      hour.each do |key, value|
        expect(value.present?).to be true 
      end
    end

    exp_keys = [:name, :summary, :precip, :precip_units, :high, :low, :temp_units, :index]
    expect(body[:daily].length).to eq(5)
    body[:daily].each do |hour|
      expect(hour.keys).to eq(exp_keys)
      hour.each do |key, value|
        expect(value.present?).to be true 
      end
    end

  end

  it "no location given" do
    get '/api/v1/forecast'

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Enter a location. api/v1/forecast?location=<city,state>")
  end

  it "bad location given" do
    get '/api/v1/forecast?location='

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Enter a location. api/v1/forecast?location=<city,state>")
    
  end
  
  
  
end