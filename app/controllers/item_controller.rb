class ItemController < ApplicationController
  def index
    render json: {
      status: "success",
      itemList: json_items(Item.where("user_id != #{params[:userId]}"))
    }
  end

  def create
    item = Item.new
    item.title = params[:title]
    item.year = params[:year]
    item.format = params[:year]
    item.user_id = params[:userId]
    if params[:picture]
      picture = Picture.new
      picture.image = params[:picture]
      if picture.save
        item.picture = picture
      end
    end
    if item.save
      item.reload
      render json: {
        status: "success",
        itemId: item.id
      }
    else
      failure "#{item.errors.first[0]} #{item.errors.first[1]}"
    end
  end

  def update
    if !(item = Item.find_by_id(params[:itemId]))
      error = "item not found"
    else
      if params[:title]
        item.title = params[:title]
      end
      if params[:year]
        item.year = params[:year]
      end
      if params[:format]
        item.format = params[:year]
      end
      if params[:picture]
        item.picture.destroy
        picture = Picture.new
        picture.image = params[:picture]
        if picture.save
          item.picture = picture
        end
      elsif item.picture
        item.picture.destroy
      end
      unless item.save
        error = "#{item.errors.first[0]} #{item.errors.first[1]}"
      end
    end
    unless error
      render json: {
        status: "success",
        itemId: item.id
      }
    else
      failure error
    end
  end

  def delete
    if !(item = Item.find_by_id(params[:itemId]))
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
      itemList: json_items(Item.where(user_id: params[:userId]))
    }
  end

  LIST = ["item_1", "item_2", "item_3"]

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

  private

  def json_items(items)
    items.map do |item|
      item.as_json(root: false,
                   except: [:created_at, :updated_at])
    end
  end
end
