module SessionsHelper
  # Creates a login user_id
  def log_in(user)
    session[:user_id] = user.id
  end

  # Creates a current user instance
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Sets logged in status according to the current user state
  def logged_in?
    !current_user.nil?
  end

  # deletes user session
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
