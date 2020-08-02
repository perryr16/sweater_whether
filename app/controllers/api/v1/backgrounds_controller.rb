class Api::V1::BackgroundsController < ApplicationController 

  def index
    if !params[:location]
      render json: {message: "Enter a location. api/v1/destination?location=<city,state>"}, status: :conflict
    else
      render json: BackgroundResults.new.format_response(params[:location])
    end
  end

  
end