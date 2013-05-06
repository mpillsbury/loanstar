class ItemController < ApplicationController
  def index
    if params[:userId]
      render json: {
        status: "success",
        itemList: Item.where("user_id != '#{params[:userId]}'")
      }
    else
      failure "user_id can't be blank"
    end
  end

  def show
    if !params[:itemId]
      error = "item_id can't be blank"
    elsif !(@item = Item.find_by_id(params[:itemId]))
      error = "item not found"
    end
    unless error
      render json: {
        status: "success",
        item: @item
      }
    else
      failure error
    end
  end

  def create
    @item = Item.new title: params[:title],
                     year: params[:year],
                     format: params[:format]
    @item.user_id = params[:userId]
    error = add_picture
    unless error
      if @item.save
        @item.reload
      else
        error = "#{@item.errors.first[0]} #{@item.errors.first[1]}"
      end
    end
    unless error
      render json: {
        status: "success",
        itemId: @item.id
      }
    else
      failure error
    end
  end

  def update
    if !params[:itemId]
      error = "item_id can't be blank"
    elsif !(@item = Item.find_by_id(params[:itemId]))
      error = "item not found"
    else
      if params[:title]
        @item.title = params[:title]
      end
      if params[:year]
        @item.year = params[:year]
      end
      if params[:format]
        @item.format = params[:format]
      end
      error = add_picture
    end
    unless error
      unless @item.save
        error = "#{@item.errors.first[0]} #{@item.errors.first[1]}"
      end
    end
    unless error
      render json: {
        status: "success",
        itemId: @item.id
      }
    else
      failure error
    end
  end

  def delete
    if !params[:itemId]
      error = "item_id can't be blank"
    elsif !(item = Item.find_by_id(params[:itemId]))
      error = "item not found"
    elsif item.destroy.nil?
      error = "delete failed"
    end
    unless error
      render json: {
        status: "success"
      }
    else
      failure error
    end
  end

  def index_by_user
    render json: {
      status: "success",
      itemList: Item.where(user_id: params[:userId])
    }
  end

  def borrows_by_user
    if !params[:userId]
      error = "user_id can't be blank"
    else
      borrows = Borrow.where(user_id: params[:userId])
                      .where("start_date IS NOT NULL AND end_date IS NULL")
                      .includes(:item)
      items = borrows.map{|borrow| borrow.item}.uniq
    end
    unless error
      render json: {
        status: "success",
        itemList: items
      }
    else
      failure error
    end
  end

  def requests_by_user
    if !params[:userId]
      error = "user_id can't be blank"
    else
      requests_by = Borrow.where(user_id: params[:userId])
                          .where("start_date IS NULL AND end_date IS NULL")
                          .includes(:item)
      requests_by_items = requests_by.map{|borrow| borrow.item}.uniq
      requests_for_items = Item.joins(:borrows)
                               .where("items.user_id" => params[:userId])
                               .where("borrows.start_date IS NULL AND borrows.end_date IS NULL")
    end
    unless error
      render json: {
        status: "success",
        requestsByList: requests_by_items,
        requestsForList: requests_for_items
      }
    else
      failure error
    end
  end

  private

  def add_picture
    if @item.picture = nil
      @item.picture.destroy
    end
    if params[:picture]
      if params[:contentType]
        @item.build_picture image: ActiveSupport::Base64.decode64(params[:picture]),
                            content_type: params[:contentType]
      else
        error = "context_type can't be blank"
      end
    end
    error
  end
end
