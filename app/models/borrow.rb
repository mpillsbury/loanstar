class Borrow < ActiveRecord::Base
  attr_accessible :request_date, :status, :start_date, :end_date

  validates :request_date, :user_id, :item_id, presence: true

  belongs_to :user
  belongs_to :item

  def self.delete_old_borrows(date = Date.today)
    Borrow.destroy_all("end_date < '#{date.to_s}'")
  end
end
