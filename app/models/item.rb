class Item < ActiveRecord::Base
  attr_accessible :title, :year, :format

  validates :title, :year, :format, :user_id, presence: true

  belongs_to :user
  has_one :picture, dependent: :destroy
end
