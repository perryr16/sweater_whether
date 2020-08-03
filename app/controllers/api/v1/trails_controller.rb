class Api::V1::TrailsController < ApplicationController 

  def index 
    render json: TrailResults.new(params[:location]).format_response
  end
  
end