class Picture < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionDispatch::Routing::UrlFor

  attr_accessible :image, :content_type

  validates :item_id, :image, :content_type, presence: true

  belongs_to :item

  def url
    url_for(host: "primatehouse.com",  # this is certainly the wrong way to do it
            controller: 'picture',
            action: 'show',
            id: id)
  end
end
