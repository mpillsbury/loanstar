class ApiController < ApplicationController
  def ping
    render json: {
      status: "success",
      message: "hello world"
    }
  end

  def login
    @email = params[:email]
    @hashed_password = params[:hashedPassword]
    render json: {
      status: "success",
      userId: "user_id",
      in: params
    }
  end
end
