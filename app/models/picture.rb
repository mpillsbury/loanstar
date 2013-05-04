class Picture < ActiveRecord::Base
  attr_accessible :image

  validates :item_id, :image, :content_type, presence: true

  belongs_to :item
end
