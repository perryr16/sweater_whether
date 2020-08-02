class Api::V1::ForecastController < ApplicationController 

  def index
    if !params[:location] || params[:location].empty?
      render json: {message: "Enter a location. api/v1/forecast?location=<city,state>"}, status: :conflict
    else
      render json: Forecast.new(params).format_response
    end
  end
  
end