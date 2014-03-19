class ApplicationController < ActionController::Base
  before_action :find_player
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   protected
  	def find_player
  		if session[:player_id] != nil
  			@auth_player = Player.find_by(id: session[:player_id])
  		else
  			@auth_player = nil
  		end
  	end

    def authorize
      unless Player.find_by(id: session[:player_id])
        redirect_to login_url, notice: "Please log in!"
      end
    end
end
