class MyDevise::RegistrationsController < Devise::RegistrationsController

	
  def create
    super
    if resource.save
      @profile         = Profile.new()
      @profile.user_id = resource.id
      @profile.save 
    end
  end

end