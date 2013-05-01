class ApplicationController < ActionController::Base
  protect_from_forgery

  def failure(message)
      render json: {
        status: "failure",
        message: message
      }
  end
end
