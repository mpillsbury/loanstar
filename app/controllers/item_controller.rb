class ItemController < ApplicationController
  LIST = ["item_1", "item_2", "item_3"]
  def index
    render json: {
      status: "success",
      itemList: LIST,
      in: params
    }
  end

  def create
    item = Item.new
    item.title = params[:title]
    item.year = params[:year]
    item.format = params[:year]
    # do something with the picture
    if params[:picture]
      picture = Picture.new
      picture.image = params[:picture]
      if picture.save
        item.picture = picture
      end
    end
    item.user_id = params[:userId]
    if item.save
      item.reload
      render json: {
        status: "success",
        itemId: item.id
      }
    else
      render json: {
        status: "failure",
        message: "#{item.errors.first[0]} #{item.errors.first[1]}"
      }
    end
  end

  def update
    @title = params[:title]
    @year = params[:year]
    @format = params[:year]
    @picture = params[:picture]
    @item_id = params[:itemId]
    render json: {
      status: "success",
      userId: "user_id",
      in: params
    }
  end

  def delete
    @item_id = params[:itemId]
    render json: {
      status: "success",
      in: params
    }
  end

  def index_by_user
    @user_id = params[:userId]
    render json: {
      status: "success",
      itemList: LIST,
      in: params
    }
  end

  def requests_by_user
    @user_id = params[:userId]
    render json: {
      status: "success",
      userId: "user_id",
      itemLists: {
       requestedByList: LIST,
       requestedFromList: LIST
      },
      in: params
    }
  end

  def borrows_by_user
    @user_id = params[:userId]
    render json: {
      status: "success",
      itemList: LIST,
      in: params
    }
  end

end
