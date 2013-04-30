class BorrowController < ApplicationController
  def create
    @request_date = params[:requestDate]
    @item_id = params[:itemId]
    @user_id = params[:userId]
    @status = params[:status]
    render json: {
      status: "success",
      borrowId: "borrow_id",
      in: params
    }
  end

  def update
    @id = params[:borrowId]
    @start_date = params[:startDate]
    @end_date = params[:endDate]
    @status = params[:status]
    render json: {
      status: "success",
      borrowId: "borrow_id",
      in: params
    }
  end
end
