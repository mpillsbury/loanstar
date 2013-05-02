class Borrow < ActiveRecord::Base
  attr_accessible :request_date, :start_date, :end_date

  belongs_to :user
  belongs_to :item

  validates :request_date, :user_id, :item_id, presence: true

  after_save :destroy_if_ended

  def as_json options = {}
    {
      borrowId: id,
      requestDate: (request_date.to_time.to_i if request_date),
      startDate: (start_date.to_time.to_i if start_date),
      userAccount: user
    }
  end

  private

  def destroy_if_ended
    if end_date and end_date < Date.today
      destroy
    end
  end
end
