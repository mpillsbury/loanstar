class BorrowController < ApplicationController
  def create
    borrow = Borrow.new request_date: params[:requestDate]
    borrow.item_id = params[:itemId]
    borrow.user_id = params[:userId]
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
    if !params[:borrowId]
      error = "borrow_id can't be blank"
    elsif !(borrow = Borrow.find_by_id(params[:borrowId]))
      error = "borrow not found"
    else
      if params[:startDate]
        borrow.start_date = params[:startDate]
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
