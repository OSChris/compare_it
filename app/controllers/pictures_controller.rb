class PicturesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :find_gallery
  before_action :find_picture, only: [:show]
  before_action :find_user_picture, only: [:destroy]

  def index
    @pictures = @gallery.pictures
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = @gallery.pictures.new(picture_params)
    @picture.user = current_user
    if @picture.save
      redirect_to [@gallery.eatery, @gallery], notice: "Picture successfully uploaded!"
    else
      render :new
      flash.now[:alert] = "Something went wrong"
    end
  end

  def destroy
    @picture.destroy
    redirect_to [@gallery.eatery, @gallery], notice: "Picture deleted."
  end

  private

  def find_gallery
    @gallery = Gallery.find params[:gallery_id]
  end

  def find_picture
    @picture = @gallery.pictures.find params[:id]
  end

  def find_user_picture
    @picture = current_user.pictures.find params[:id]
  end

  def picture_params
    params.require(:picture).permit(:picture)
  end

end
