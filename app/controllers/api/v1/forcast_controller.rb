class Api::V1::ForcastController < ApplicationController 

  def index
    if !params[:location] || params[:location].empty?
      render json: {message: "Enter a location. api/v1/forcast?location=<city,state>"}, status: :conflict
    else
      render json: Forcast.new(params).format_response
    end
  end
  
end