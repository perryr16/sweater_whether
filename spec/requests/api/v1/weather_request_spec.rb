require 'rails_helper'

describe "Weather API" do 

  it "sends weather info for a location" do 
    get '/api/v1/forecast?location=denver,co'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body.keys).to eq([:forecast, :hourly, :daily])
    exp_keys = [:id, :city, :state, :country, :date, :summary, :sunrise, :sunset, :created_at, :updated_at, :temp_units, :visibility_units, :humidity_units, :uv_index_rating, :high, :low, :feels_like, :humidity, :visibility, :temp, :uv_index]
    expect(body[:forecast].keys).to eq(exp_keys)
    body[:forecast].each do |key, value|
      expect(value.present?).to be true
    end

    exp_keys = [:id, :weather_id, :name, :summary, :index, :temp_units, :temp]
    expect(body[:hourly].length).to eq(8)
    body[:hourly].each do |hour|
      expect(hour.keys).to eq(exp_keys)
      hour.each do |key, value|
        expect(value.present?).to be true 
      end
    end

    exp_keys = [:id, :weather_id, :name, :summary, :index, :temp_units, :precip_units, :high, :low, :precip]
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

    expect(response.status).to eq(409)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Enter a location. api/v1/forecast?location=<city,state>")
  end

  it "bad location given" do
    get '/api/v1/forecast?location='

    expect(response.status).to eq(409)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Enter a location. api/v1/forecast?location=<city,state>")
    
  end
  
  
  
end