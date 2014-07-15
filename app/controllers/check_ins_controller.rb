class CheckInsController < ApplicationController

  def statuscheck

  end

  def geocheckin
    lat = params[:lat]
    lon = params[:lon]
    @kents = Kents.last

    if @kents.distance_from([lat, lon]) <= 0.05
      @validation = current_user.build_kent_validation
      @validation.save
      redirect_to root_path, notice: "You're now verified! Your reviews will be taken seriously now!"
    else
      flash.now[:alert] = "You aren't in Kent's Kitchen!"
      render :statuscheck
    end
  end

end
