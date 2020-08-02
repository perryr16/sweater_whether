require 'rails_helper'

describe "Road Trip API" do 
  before :each do 
    @user1 = create(:user, email: 'user1@email.com', password: '123', api_key: "3665f453ef5179ec0a4e1e37ea5ff648558648491b4cb2ce92af7f1b7c92")
    @user1 = create(:user, email: 'user2@email.com', password: '456', api_key: "fad82d2dafa3da83fa7905505154958c266a27e084be3fe5d22015a5f8bf")
  end

  it "user enters details for road trip correctly" do 
    trip_params = {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "api_key": "3665f453ef5179ec0a4e1e37ea5ff648558648491b4cb2ce92af7f1b7c92"
    }

    post '/api/v1/road_trip', params: trip_params #, headers: {'HTTP_ACCEPT' => "application/json"}

    expect(response.status).to eq(201)

    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:origin]).to eq('Denver,CO')
    expect(body[:destination]).to eq('Pueblo,CO')
    expect(body[:travel_time].is_a?(Numeric)).to be true
    expect(body[:travel_time_units]).to eq('minutes')
    expect(body[:arrival_temp].is_a?(Numeric)).to be true 
    expect(body[:arrival_temp_units]).to eq('F')
    expect(body[:arrival_summary].present?).to be true

  end

  it "user enters tip details with bad api" do
    trip_params = {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "api_key": "not_a_key"
    }
    post '/api/v1/road_trip', params: trip_params

    expect(response.status).to eq(401)

    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:message]).to eq('Invalid Credentials')
  end

  it "user enters invalid tip destination with good api" do
    trip_params = {
    "origin": "Denver,CO",
    "destination": "isdvn4t4grawg24",
    "api_key": "3665f453ef5179ec0a4e1e37ea5ff648558648491b4cb2ce92af7f1b7c92"
    }
    post '/api/v1/road_trip', params: trip_params

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:message]).to eq('Unable to Find Route')
    expect(response.status).to eq(400)
  end

  it "user is missing info" do
    trip_params = {
    "origin": "Denver,CO",
    "destination": "",
    "api_key": "3665f453ef5179ec0a4e1e37ea5ff648558648491b4cb2ce92af7f1b7c92"
    }
    post '/api/v1/road_trip', params: trip_params

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:message]).to eq('Please Enter a destination')
    expect(response.status).to eq(400)

    trip_params = {
    "origin": "",
    "destination": "Pueblo,co",
    "api_key": ""
    }
    post '/api/v1/road_trip', params: trip_params

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:message]).to eq('Please Enter a origin, api_key')
    expect(response.status).to eq(400)
    
  end

  

end