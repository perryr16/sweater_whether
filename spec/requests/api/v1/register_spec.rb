require 'rails_helper'

describe "Register API" do 

  it "user registers with correct info" do 
    user_params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', params: user_params

    expect(response.status).to eq(201)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:data][:attributes]).to be_truthy
    expect(body[:data][:attributes][:email]).to be_truthy
    expect(body[:data][:attributes][:api_key]).to be_truthy
    expect(body[:data][:attributes][:password]).to be_falsey
  end

  it "user attempts to register with mismatching passwords" do 
    user_params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "not_the_same"
    }
    post '/api/v1/users', params: user_params

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Passwords Did Not Match")

  end
  it "user attempts to register with empty fields" do 
    user_params = {
      "email": "email@email.com",
      "password": "",
      "password_confirmation": "not_the_same"
    }
    post '/api/v1/users', params: user_params

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Please Enter a password")

    user_params = {
      "email": "",
      "password": "",
      "password_confirmation": ""
    }
    post '/api/v1/users', params: user_params

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Please Enter a email, password, password_confirmation")


  end

  it "user attempts to register with used email" do 
    user_params = {
      "email": "email@email.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', params: user_params

    expect(response.status).to eq(201)

    post '/api/v1/users', params: user_params

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Email in Use")
  end

  it "user attempts to register without user_params" do 
    post '/api/v1/users'

    expect(response.status).to eq(400)

    body = JSON.parse(response.body, symbolize_names: true)

    expect(body[:message]).to eq("Please Enter a email, password, password_confirmation")
  end
end

