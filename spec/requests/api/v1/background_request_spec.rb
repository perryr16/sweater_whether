require 'rails_helper'

describe "Background API" do 

  it "user requests background with correct info" do 

    get '/api/v1/backgrounds?location=denver,co'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)[:background_images]

    expect(body[:background1_url].include?('https://')).to be true
    expect(body[:background1_description].present?).to be true

    expect(body[:background2_url].include?('https://')).to be true
    expect(body[:background2_description].present?).to be true

    expect(body[:background3_url].include?('https://')).to be true
    expect(body[:background3_description].present?).to be true

    expect(body[:background4_url].include?('https://')).to be true
    expect(body[:background4_description].present?).to be true

    expect(body[:background5_url].include?('https://')).to be true
    expect(body[:background5_description].present?).to be true
  end

  it "user missing params" do
    get '/api/v1/backgrounds'

     expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Enter a location. api/v1/destination?location=<city,state>")
  end

  it "user enters a destination that is not a state abbrev" do
    
    get '/api/v1/backgrounds?location=london,uk'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)[:background_images]

    expect(body[:background1_url].include?('https://')).to be true
    expect(body[:background1_description].present?).to be true

    expect(body[:background2_url].include?('https://')).to be true
    expect(body[:background2_description].present?).to be true

    expect(body[:background3_url].include?('https://')).to be true
    expect(body[:background3_description].present?).to be true

    expect(body[:background4_url].include?('https://')).to be true
    expect(body[:background4_description].present?).to be true

    expect(body[:background5_url].include?('https://')).to be true
    expect(body[:background5_description].present?).to be true
  end

  it "user enters a destination that is a state" do
    
    get '/api/v1/backgrounds?location=colorado'

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)[:background_images]

    expect(body[:background1_url].include?('https://')).to be true
    expect(body[:background1_description].present?).to be true

    expect(body[:background2_url].include?('https://')).to be true
    expect(body[:background2_description].present?).to be true

    expect(body[:background3_url].include?('https://')).to be true
    expect(body[:background3_description].present?).to be true

    expect(body[:background4_url].include?('https://')).to be true
    expect(body[:background4_description].present?).to be true

    expect(body[:background5_url].include?('https://')).to be true
    expect(body[:background5_description].present?).to be true
  end
  
end