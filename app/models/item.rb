class Item < ActiveRecord::Base
  attr_accessible :title, :year, :format

  validates :title, :year, :format, :user_id, presence: true

  belongs_to :user
  has_one :picture, dependent: :destroy
  has_many :borrows, dependent: :destroy

  def as_json options = {}
    {
      itemId: id,
      title: title,
      year: year,
      format: format,
      pictureUrl: picture.try(:url),
      userAccount: user,
      borrows: borrows
    }
  end
end
