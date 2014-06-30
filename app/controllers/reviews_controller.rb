class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]
  before_action :find_eatery, only: [:index, :show, :new, :create, :edit, :update, :destroy, :like]
  before_action :find_review, only: [:show, :like]
  before_action :find_user_review, only: [:edit, :update, :destroy]

  def index
    @reviews = @eatery.reviews
  end

  def show
  end

  def edit
  end

  def update
    if @review.update_attributes(review_params)
      redirect_to @eatery, notice: "Successfully updated: #{@review.title}."
    else
      render :edit, alert: "Error updating the review."
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = @eatery.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @eatery, notice: "Review successfully posted!"
    else
      render :new, alert: "Something went wrong when posting your review"
    end
  end

  def destroy
    @review.destroy
    redirect_to @eatery, notice: "Review successfully deleted."
  end

  def like
    if current_user.voted_for? @review
      @review.unliked_by current_user
      redirect_to [@eatery, @review]
    else
      @review.liked_by current_user
      redirect_to [@eatery, @review]
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :price, :portion, :taste)
  end

  def find_eatery
    @eatery = Eatery.find params[:eatery_id]
  end

  def find_review
    @review = @eatery.reviews.find params[:id]
  end

  def find_user_review
    @review = current_user.reviews.find params[:id]
  end

end
