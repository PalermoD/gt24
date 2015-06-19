module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !current_user.nil? #check if user is logged in method for nav links
    end

    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
end
