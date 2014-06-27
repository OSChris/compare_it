class GalleriesController < ApplicationController

  before_action :find_eatery
  before_action :find_gallery

  def index

  end

  def show
    @pictures = @gallery.pictures
  end

  private

  def find_eatery
    @eatery = Eatery.find params[:eatery_id]
  end

  def find_gallery
    @gallery = @eatery.gallery
  end

end
