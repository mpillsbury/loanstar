class ApiController < ApplicationController
  def ping
    render json: {
      status: "success",
      message: "hello world"
    }
  end
end
