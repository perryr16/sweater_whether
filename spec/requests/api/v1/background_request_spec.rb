require 'rails_helper'

describe "Background API" do 

  xit "user requests background with correct info" do 

    get '/api/v1/backgrounds?location=denver,co'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:background_url].present?).to be true
  end

  xit "user missing params" do
    get '/api/v1/backgrounds'

     expect(response.status).to eq(409)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Enter a location. api/v1/destination?location=<city,state>")
  end

  xit "user enters a destination that is not a state abbrev" do
    
  end
  
end