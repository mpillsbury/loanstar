class BorrowController < ApplicationController
  def create
    borrow = Borrow.new
    if params[:requestDate]
      borrow.request_date = Time.at(params[:requestDate].to_i).to_date
    end
    if params[:startDate]
      borrow.start_date = Time.at(params[:startDate]).to_i.to_date
    end
    if params[:endDate]
      borrow.end_date = Time.at(params[:endDate]).to_i.to_date
    end
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
        borrow.start_date = Time.at(params[:startDate].to_i).to_date
      end
      if params[:endDate]
        borrow.end_date = Time.at(params[:endDate].to_i).to_date
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
