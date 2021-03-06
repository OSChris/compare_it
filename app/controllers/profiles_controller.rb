class ProfilesController < ApplicationController

  before_action :find_user_profile, only: [:edit, :update]
  before_action :find_profile, only: [:show, :like]
  before_action :authenticate_user!, except: [:show]

  def show
    @liked_reviews = @profile.user.get_voted(Review).limit(5)
    @liked_eateries = @profile.user.get_voted(Eatery).limit(5)
  end

  def edit
  end

  def update
    if @profile.update_attributes(profile_params)
      redirect_to @profile, notice: "Profile updated!"
    else
      render :edit
      flash.now[:alert] = "Something went wrong when updating your profile."
    end
  end

  def like
    respond_to do |format|
      if current_user.voted_for? @profile
        @profile.unliked_by current_user
        format.html { redirect_to @profile }
        format.js   { render }
      else
        @profile.liked_by current_user
        format.html { redirect_to @profile }
        format.js   { render }
      end
    end
  end

  private

  def find_user_profile
    @profile = current_user.profile
  end

  def find_profile
    @profile = Profile.find params[:id] 
  end

  def profile_params
    params.require(:profile).permit(:bio, :avatar)
  end

end
