class HomeController < ApplicationController

  def home
    @popular_eats = Eatery.popular_eats.limit(8)
    @hall_of_fame = Eatery.hall_of_fame.limit(3)
    @hall_of_shame = Eatery.hall_of_shame.limit(3)
  end

end
