class EventsController < ApplicationController
  # Directs to all events
  def index
    @events = Event.all
    @event = Event.find_by(id: params[:id])
  end

  # Directs new to event creation
  def new
    @event = current_user.events.build
  end

  # creates and saves a new valid event
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to(@event)
    else
      render('new')
    end
  end

  # shows one event
  def show
    @event = Event.find(params[:id])
  end

  private

  # event accepted parameters
  def event_params
    params.require(:event).permit(:desc, :user_id, :date)
  end
end
