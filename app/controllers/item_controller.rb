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
    @title = params[:title]
    @year = params[:year]
    @format = params[:year]
    @picture = params[:picture]
    @user_id = params[:userId]
    render json: {
      status: "success",
      itemId: "item_id",
      in: params
    }
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
