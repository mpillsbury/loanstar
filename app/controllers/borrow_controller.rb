class BorrowController < ApplicationController
  def create
    borrow = Borrow.new
    borrow.request_date = params[:requestDate]
    borrow.item_id = params[:itemId]
    borrow.user_id = params[:userId]
    borrow.status = params[:status]
    if borrow.save
      borrow.reload
      render json: {
        status: "success",
        borrowId: borrow.id
      }
    else
      failure "#{borrow.errors.first[0]} #{borrow.errors.first[1]}"
    end
  end

  def update
    if !(borrow = Borrow.find_by_id(params[:borrowId]))
      error = "borrow not found"
    else
      if params[:borrowId]
        borrow.id = params[:borrowId]
      end
      if params[:startDate]
        borrow.start_date = params[:startDate]
      end
      if params[:endDate]
        borrow.end_date = params[:endDate]
      end
      if params[:status]
        borrow.status = params[:status]
      end
      unless borrow.save
        error = "#{borrow.errors.first[0]} #{borrow.errors.first[1]}"
      end
    end
    unless error
      render json: {
        status: "success",
        borrowId: borrow.id
      }
    else
      failure error
    end
  end
end
