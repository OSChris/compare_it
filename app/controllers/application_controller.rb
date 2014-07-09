class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_params, if: :devise_controller?
    

  private

  def configure_devise_permitted_params
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name]
  end

  def popular_eats
    @popular_eats ||= Eatery.popular_eats.limit(5)
  end
  helper_method :popular_eats

  def hall_of_fame
    @hall_of_fame = Eatery.hall_of_fame.limit(3).order("total_average DESC")
  end
  helper_method :hall_of_fame
  
end
