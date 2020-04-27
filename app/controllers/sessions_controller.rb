class SessionsController < ApplicationController
  # new session creation
  def new; end

  # create a new session and logging in
  def create
    user = User.find_by(name: params[:session][:name])

    if user
      log_in(user)
      redirect_to(user)
    else
      render('new')
    end
  end

  # Logs user out and destroys the session
  def destroy
    log_out
    redirect_to(root_url)
  end
end
