class Picture < ActiveRecord::Base
  attr_accessible :image

  belongs_to :item
end
