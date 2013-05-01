class UserController < ApplicationController
  def create
    user = User.new
    user.email = params[:email]
    user.password = params[:hashedPassword]
    user.display_name = params[:displayName]
    if user.save
      user.reload
      render json: {
        status: "success",
        userId: user.id
      }
    else
      failure "#{user.errors.first[0]} #{user.errors.first[1]}"
    end
  end

  def login
    email = params[:email]
    password = params[:hashedPassword]
    if !params[:email]
      error = "email can't be blank"
    elsif !(user = User.find_by_email(email))
      error = "user not found"
    elsif user.password != password
      error = "incorrect password"
    end
    unless error
      render json: {
        status: "success",
        userId: user.id,
        displayName: user.display_name
      }
    else
      failure error
    end
  end
end
