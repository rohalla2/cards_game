class SessionsController < ApplicationController

	 def create
    user_email = params[:email].downcase
  	user = Player.find_by(email: user_email)
  	if user and user.authenticate(params[:password])
  		session[:player_id] = user.id
  		redirect_to player_path(user)
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
  	end
  end

  def destroy
    reset_session
    redirect_to root_url , notice: "Logged out"
  end
end
