class Api::V1::RoadTripController < ApplicationController 

  def create
    user = User.find_by(api_key: params[:api_key])
    if missing_params.present?
      render json: {message: "Please Enter a #{missing_params}"}, status: :bad_request
    elsif !user 
      render json: {message: "Invalid Credentials"}, status: :unauthorized
    elsif RoadTripResults.new(params).travel_time.nil?
      render json: {message: "Unable to Find Route"}, status: :bad_request
    else 
      render json: RoadTripResults.new(params).format_response, status: :created
    end
  end

  private 

  def missing_params
    missing_params = []
    params.each do |key, value|
      if value == ""
        missing_params << "#{key}"
      end
    end
    missing_params.join(", ")
  end
  
end