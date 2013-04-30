class Picture < ActiveRecord::Base
  attr_accessible :image

  validates :item_id, presence: true

  belongs_to :item
end
