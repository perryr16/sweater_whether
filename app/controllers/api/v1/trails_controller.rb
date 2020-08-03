class Api::V1::TrailsController < ApplicationController 

  def index 
    if missing_params 
      render json: {message: "No Location Found. api/v1/trails?location<city,state>"}, status: :bad_request
    else
      render json: TrailResults.new(params[:location]).format_response
    end
  end

  private 

  def missing_params
    !params[:location] || params[:location].blank?
  end
  
end