class Api::V1::SessionsController < ApplicationController 

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else 
      render json: {message: "Incorrect username of password"}, status: :conflict
    end
  end

end