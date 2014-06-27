class ProfilesController < ApplicationController

  before_action :find_profile, except: [:show]
  before_action :authenticate_user!, except: [:show]

  def show
    @profile = Profile.find params[:id] 
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

  private

  def find_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:bio, :avatar)
  end

end
