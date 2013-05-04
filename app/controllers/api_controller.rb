class ApiController < ApplicationController
  def ping
    render json: {
      status: "success",
      message: "hello world"
    }
  end

  def reset
    # sort of a hack
    %x[rake db:reset]
    render json: {
      status: "success"
    }
  end

  def reload
    begin
      paul = add_user "paul@paulhimes.com", "paul", "Paul Himes"
      bob = add_user "redusek@gmail.com", "redusek", "Bob Dusek"
      chad = add_user "chadmlinke@gmail.com", "chadmlinke", "Chad Linke"

      item_1 = add_item "Rudy", 1993, "vhs", bob.id
      item_2 = add_item "Jurassic Park", 1993, "dvd", bob.id
      item_3 = add_item "Serenity", 2005, "bluray", bob.id
      item_4 = add_item "The Terminator", 1984, "vhs", bob.id
      item_5 = add_item "The Matrix", 1999, "dvd", bob.id
      item_6 = add_item "The Dark Crystal", 1982, "bluray", paul.id
      item_7 = add_item "Raiders of the Lost Ark", 1981, "vhs", paul.id
      item_8 = add_item "Star Wars", 1977, "dvd", paul.id

      borrow_2 = add_borrow 2.days.ago, 1.days.ago, item_2.id, chad.id
      borrow_3 = add_borrow 2.days.ago, 1.days.ago, item_3.id, paul.id
      borrow_4 = add_borrow 1.days.ago, nil, item_4.id, paul.id
      borrow_5 = add_borrow 4.days.ago, 2.days.ago, item_5.id, chad.id
      borrow_5_b = add_borrow 3.days.ago, nil, item_5.id, paul.id
      borrow_7 = add_borrow 2.days.ago, nil, item_7.id, bob.id
      borrow_8 = add_borrow 2.days.ago, 1.days.ago, item_8.id, bob.id
    rescue Exception => e
      error = e.message
    end

    unless error
      render json: {
        status: "success"
      }
    else
      failure error
    end

  end

  private

  def add_user email, password, display_name
    user = User.new email: email, password: password, display_name: display_name
    user.save!
    user.reload
  end

  def add_item title, year, format, user_id
    item = Item.new title: title, year: year, format: format
    item.user_id = user_id
    item.save!
    item.reload
  end

  def add_borrow request_date, start_date, item_id, user_id
    borrow = Borrow.new request_date: request_date, start_date: start_date
    borrow.item_id = item_id
    borrow.user_id = user_id
    borrow.save!
  end
end
