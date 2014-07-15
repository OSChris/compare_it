class CheckInsController < ApplicationController

  def statuscheck

  end

  def geocheckin
    result = request.location
    kentslat = Kents.first.latitude
    kentslong = Kents.first.longitude

    if result.distance_from([kentslat, kentslong]) <= 0.03
      @validation = current_user.build_kent_validation
      @validation.save
    else
      flash.now[:alert] = "You aren't in Kent's Kitchen!"
      render :statuscheck
    end
  end

end
