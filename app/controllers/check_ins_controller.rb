class CheckInsController < ApplicationController

  def statuscheck

  end

  def geocheckin
    result = request.location
    @kents = Kents.first

    if @kents.distance_from(result.coordinates) <= 0.05
      @validation = current_user.build_kent_validation
      @validation.save
      redirect_to root_path, notice: "You're now verified! Your reviews will be taken seriously now!"
    else
      flash.now[:alert] = "You aren't in Kent's Kitchen!"
      render :statuscheck
    end
  end

end
