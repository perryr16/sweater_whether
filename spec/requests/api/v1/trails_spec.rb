require 'rails_helper'

describe "Trails API" do 

  it "trails path returns weather and trail data" do

    get '/api/v1/trails?location=denver,co'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:data][:attributes].keys).to eq([:location, :forecast, :trails])

    location_data = body[:data][:attributes][:location]
    expect(location_data).to eq('denver,co')

    forecast_data = body[:data][:attributes][:forecast]
    expect(forecast_data[:summary].present?).to be true
    expect(forecast_data[:temperature].present?).to be true
    expect(forecast_data[:temperature].to_i).to_not eq(0) unless forecast_data[:temperature == '0']
    expect(forecast_data[:not_a_value].present?).to be false
    
    trail_data = body[:data][:attributes][:trails]
    exp_difficulty = ['black', 'blue', 'green', 'blueBlack', 'doubleBlack', 'greenBlue']
    expect(trail_data.class).to be Array 

    trail_data.each do |trail|
      expect(trail[:name].present?).to be true
      expect(trail[:summary].present?).to be true
      expect(trail[:difficulty].present?).to be true
      expect(exp_difficulty.include?(trail[:difficulty])).to be true
      expect(trail[:location].present?).to be true
      expect(trail[:distance_to_trail].present?).to be true
      expect(trail[:distance_to_trail].to_i).to_not eq(0) unless trail[:distance_to_trail] == '0'
      expect(trail[:not_a_value].present?).to be false
    end
  end

  it "sad path: missing params" do

    get '/api/v1/trails'

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("No Location Found. api/v1/trails?location<city,state>")

  end

  it "sad path: missing location paramater" do

    get '/api/v1/trails?location='

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("No Location Found. api/v1/trails?location<city,state>")

  end

  it "sad path: unknown location returns no trails & fail gracefully" do

    get '/api/v1/trails?location=adf3asdf'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)

    attributes = body[:data][:attributes]

    expect(attributes[:location]).to eq('adf3asdf')
    expect(attributes[:forecast][:summary].present?).to be true
    expect(attributes[:forecast][:temperature].present?).to be true
    expect(attributes[:trails].empty?).to be true
  end
  
  
end
