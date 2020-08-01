require 'rails_helper'

describe "Weather API" do 

  it "sends weather info for a location" do 
    get '/api/v1/forcast?location=denver,co'

    binding.pry
  end
  
end