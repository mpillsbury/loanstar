class ApiController < ApplicationController
  def ping
    render json: {
      status: "success",
      message: "wtf"
    }
  end

end
