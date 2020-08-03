require 'rails_helper'

describe "Trails API" do 

  it "trails path returns weather and trail data" do

    get '/api/v1/trails?location=denver,co'

    expect(response.status).to eq(200)

    body = JOSN.parse(response.body, symbolize_names: true)

    expect(body[:data][:attributes].keys).to eq([:location, :forecast, :trails])

    location_data = body[:data][:attributes][:location]
    expect(location_data).to eq('denver,co')

    forcast_data = body[:data][:attributes][:forcast]
    expect(forcast_data[:summary].present?).to be true
    expect(forcast_data[:temperature].present?).to be true
    expect(forcast_data[:temperature].to_i).to_not eq(0) unless forcast_data[:temperature == '0']
    
    trail_data = body[:data][:attribtues][:trails]
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
    end
  end
  
end
