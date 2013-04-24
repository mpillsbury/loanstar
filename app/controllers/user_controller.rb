class UserController < ApplicationController
  def create
    @email = params[:email]
    @hashed_password = params[:hashedPassword]
    @display_name = params[:displayName]
    render json: {
      status: "success",
      userId: "user_id",
      in: params
    }
  end
end
