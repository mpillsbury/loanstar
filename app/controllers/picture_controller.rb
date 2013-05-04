class PicturesController < ApplicationController
  def show
    if @picture = Picture.find_by_id(params[:id])
      send_data @picture.image, type: @picture.content_type, disposition: "inline"
    else
      render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
    end
  end
end
