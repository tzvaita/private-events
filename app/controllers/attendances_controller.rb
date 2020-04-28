class AttendancesController < ApplicationController
  # new attendance instance
  def new; end

  # create new attendance
  def create
    @event = Event.find(params[:event_id])
    current_user.attend(@event)
    @user = User.find_by(id: params[:id])
    redirect_to(@event)
  end
end
