class Api::V1::ForcastController < ApplicationController 

  def index
    forcast = Forcast.new(params[:location])
    render json: forcast.format_response

  end
  
end