class Borrow < ActiveRecord::Base
  attr_accessible :request_date, :start_date

  validates :request_date, :user_id, :item_id, presence: true

  belongs_to :user
  belongs_to :item
end
