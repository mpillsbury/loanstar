class UserController < ApplicationController
  def create
    user = User.new
    user.email = params[:email]
    user.password = params[:hashedPassword]
    user.display_name = params[:displayName]
    if user.save
      render json: {
        status: "success",
        userId: "user_id"
      }
    else
      render json: {
        status: "failure",
        message: "#{user.errors.first[0]} #{user.errors.first[1]}"
      }
    end
  end
end
