require 'rails_helper'

describe "Register API" do 
  before :each do     
    user_params = {
      "email": "correct@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', params: user_params
    @user = User.last
  end

  it "user logs in with correct info" do 
    user_params = {
      "email": "correct@example.com",
      "password": "password"
    }
    post '/api/v1/sessions', params: user_params

    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:data][:attributes]).to be_truthy
    expect(body[:data][:attributes][:email]).to eq(@user.email)
    expect(body[:data][:attributes][:api_key]).to eq(@user.api_key)
    expect(body[:data][:attributes][:password]).to be_falsey
    
  end

  it "user logs in with incorrect email" do 
    user_params = {
      "email": "wrong@example.com",
      "password": "password"
    }
    post '/api/v1/sessions', params: user_params

    expect(response.status).to eq(409)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Incorrect username of password")
    
  end

  it "user logs in with incorrect password" do 
    user_params = {
      "email": "correct@example.com",
      "password": "wrong"
    }
    post '/api/v1/sessions', params: user_params

    expect(response.status).to eq(409)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Incorrect username of password")
    
  end
end