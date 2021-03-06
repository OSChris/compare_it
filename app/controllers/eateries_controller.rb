class EateriesController < ApplicationController

  before_action :find_eatery, only: [:show, :like]
  before_action :authenticate_user!, only: [:like]

  def index
    @eateries = Eatery.search params[:search],
    fields: [{name: :word_start}],
    operator: "or",
    misspellings: { distance: 2 },
    page: params[:page], 
    per_page: 10 


    render :index
  end

  def show
    @review = Review.new
    @top_reviews = @eatery.reviews.best_reviews.limit(3)
    if @eatery.gallery
      @gallery = @eatery.gallery
      @pictures = @gallery.pictures.limit(6)
    end
  end

  def import
    Eatery.import(params[:file])
    redirect_to eateries_path, notice: "Eateries imported."
  end

  def like
    respond_to do |format|
      if current_user.voted_for? @eatery
        @eatery.unliked_by current_user
        format.html { redirect_to @eatery }
        format.js   { render }
      else
        @eatery.liked_by current_user
        format.html { redirect_to @eatery }
        format.js   { render }
      end
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
