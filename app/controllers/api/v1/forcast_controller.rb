class Api::V1::ForcastController < ApplicationController 

  def index
    forcast = Forcast.new(params)
    render json: forcast.format_response
  end
  
end