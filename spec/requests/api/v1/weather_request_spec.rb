require 'rails_helper'

describe "Weather API" do 

  it "sends weather info for a location" do 
    get '/api/v1/forcast?location=denver,co'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body.keys).to eq([:forcast, :hourly, :daily])

    exp_keys = [:id, :city, :state, :country, :high, :low, :date, :summary, :feels_like, :humidity, :visibility, :uv_index, :sunrise, :sunset, :created_at, :updated_at, :temp]
    expect(body[:forcast].keys).to eq(exp_keys)
    body[:forcast].each do |key, value|
      expect(value.present?).to be true
    end

    exp_keys = [:id, :weather_id, :name, :summary, :temp, :index]
    expect(body[:hourly].length).to eq(8)
    body[:hourly].each do |hour|
      expect(hour.keys).to eq(exp_keys)
      hour.each do |key, value|
        expect(value.present?).to be true 
      end
    end

    exp_keys = [:id, :weather_id, :name, :summary, :precip, :high, :low, :index]
    expect(body[:daily].length).to eq(5)
    body[:daily].each do |hour|
      expect(hour.keys).to eq(exp_keys)
      hour.each do |key, value|
        expect(value.present?).to be true 
      end
    end

  end

  it "no location given" do
    get '/api/v1/forcast'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Enter a location. api/v1/forcast?location=<city,state>")
  end
  
  
end