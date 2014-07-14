class EateriesController < ApplicationController

  before_action :find_eatery, only: [:show, :like]
  before_action :authenticate_user!, only: [:like]

  def index
    @eateries = Eatery.search params[:search],
    fields: [{name: :word_start}],
    operator: "or",
    page: params[:page], 
    per_page: 10 


    render :index
  end

  def show
    @review = Review.new
    @top_reviews = @eatery.reviews.best_reviews.limit(3)
    @gallery = @eatery.gallery
    @pictures = @gallery.pictures.limit(6)
  end

  def import
    Eatery.import(params[:file])
    redirect_to eateries_path, notice: "Eateries imported."
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

  def importer
    render :importer
  end

  private

  def find_eatery
    @eatery = Eatery.find(params[:id])
  end

end
