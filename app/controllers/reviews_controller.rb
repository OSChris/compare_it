class ReviewsController < ApplicationController
  before_action :find_eatery, only: [:index, :show, :create, :edit, :update, :destroy]
  before_action :find_review, only: [:index, :show, :edit, :update]

  def index
    @reviews = @eatery.reviews
  end

  def show
  end

  def edit
  end

  def update
    if current_user == @review.user
      if @review.update_attributes(review_params)
        redirect_to @eatery, notice: "Successfully updated: #{@review.title}."
      else
        render :edit, alert: "Error updating the review."
      end
    else
      flash.now[:alert] = "That's not yours buster."
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
    @review = current_user.reviews.find params[:id]
    if current_user == @review.user
      @review.destroy
      redirect_to @eatery, notice: "Review successfully deleted."
    else
      flash.now[:alert] = "Not yours buster"
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :description)
  end

  def find_eatery
    @eatery = Eatery.find params[:eatery_id]
  end

  def find_review
    @review = @eatery.reviews.find params[:id]
  end

end
