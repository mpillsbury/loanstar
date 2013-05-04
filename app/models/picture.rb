class Picture < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include ActionDispatch::Routing::UrlFor

  attr_accessible :image, :content_type

  belongs_to :item

  validates :image, :content_type, presence: true

  def url
    url_for(host: "primatehouse.com",  # this is certainly the wrong way to do it
            port: 8086,
            controller: 'picture',
            action: 'show',
            id: id)
  end
end
