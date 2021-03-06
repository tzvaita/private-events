class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Welcome to private events'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @attendee = User.find(params[:id])
    @events = @user.events
    @attendances = @user.attendances
    @upcoming_events = @events.upcoming
    @previous_events = @events.past
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
