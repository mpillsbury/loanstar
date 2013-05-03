class ApplicationController < ActionController::Base

  def failure message
      render json: {
        status: "failure",
        message: message
      }
  end
end
