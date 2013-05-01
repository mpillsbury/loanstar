class Borrow < ActiveRecord::Base
  attr_accessible :request_date, :start_date

  validates :request_date, :user_id, :item_id, presence: true

  belongs_to :user
  belongs_to :item

  def as_json options = {}
    {
      borrowId: id,
      requestDate: (request_date.to_time.to_i if request_date),
      startDate: (start_date.to_time.to_i if start_date),
      userAccount: user
    }
  end
end
