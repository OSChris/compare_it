class EateriesController < ApplicationController

  before_action :find_eatery, only: [:show, :like]
  before_action :authenticate_user!, only: [:like]

  def index
    @eateries = Eatery.paginate(page: params[:page]).order("total_average DESC")
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

  def like
    if current_user.voted_for? @eatery
      @eatery.unliked_by current_user
      redirect_to @eatery
    else
      @eatery.liked_by current_user
      redirect_to @eatery
    end
  end

  private

  def find_eatery
    @eatery = Eatery.find(params[:id])
  end

end
