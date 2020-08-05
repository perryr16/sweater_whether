require 'securerandom'
class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(new_user_params)
    if missing_params.present?
      render json: {message: "Please Enter a #{missing_params}"}, status: :bad_request
    elsif no_params.present?
      render json: {message: "Please Enter a #{no_params}"}, status: :bad_request
    elsif password_mismatch?
      render json: {message: "Passwords Did Not Match"}, status: :bad_request
    elsif !user.save
      render json: {message: "Email in Use"}, status: :bad_request
    else
      render json: UserSerializer.new(user), status: :created
    end


  end

  def new_user_params
    {
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password],
      api_key: SecureRandom.hex(30)
    }
  end

  def password_mismatch?
    params[:password] != params[:password_confirmation]
  end

  def missing_params
    missing_params = []
    params.each do |key, value|
      if value == ""
        missing_params << "#{key}"
      end
    end
    missing_params.join(", ")
  end

  def no_params
    message = []
      message << 'email' if !params[:email]
      message << 'password' if !params[:password]
      message << 'password_confirmation' if !params[:password_confirmation]
      message.join(', ')
  end

end