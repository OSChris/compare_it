class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

def twitter
  oauth_data = request.env["omniauth.auth"].to_hash
  user = User.find_or_create_from_twitter(oauth_data)
  if user
    sign_in user
    redirect_to root_path, notice: "Signed in!"
  else
    redirect_to root_path, alert: "Sorry couldn't sign you in."
  end
end

def google_oauth2
  oauth_data = request.env["omniauth.auth"].to_hash
  user = User.find_or_create_from_google(oauth_data)
  if user
    sign_in user
    redirect_to root_path, notice: "Signed in!"
  else
    redirect_to root_path, alert: "Sorry couldn't sign you in."
  end
end

end