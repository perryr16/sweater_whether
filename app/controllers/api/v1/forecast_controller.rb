class Api::V1::ForecastController < ApplicationController 

  def index
    if !params[:location] || params[:location].empty?
      render json: {message: "Enter a location. api/v1/forecast?location=<city,state>"}, status: :bad_request
    else
      render json: ForecastResults.new(params[:location]).format_response
    end
  end
  
end