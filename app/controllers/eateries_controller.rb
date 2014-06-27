class EateriesController < ApplicationController

  before_action :find_eatery, only: [:show]

  def index
    @eateries = Eatery.all
  end

  def show
    @review = Review.new
    @gallery = @eatery.gallery
    @pictures = @gallery.pictures.limit(6)
  end

  def import
    Eatery.import(params[:file])
    redirect_to root_url, notice: "Eateries imported."
  end

  private

  def find_eatery
    @eatery = Eatery.find(params[:id])
  end

end
