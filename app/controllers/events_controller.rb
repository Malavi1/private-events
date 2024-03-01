class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]


  def index
    @events = Event.all
    @events_today = Event.today 
    @events_past = Event.past 
    @events_future = Event.future
  end

  def show 
      @event = Event.find_by(params[:id])
  end

  def new
    @event = Event.new
  end
    
  def create
    @event = current_user.events.build(new_event_params)
    if @event.save
      flash[:success] = 'Event Created Successfully'
      redirect_to events_path 
    else
      render :new
    end
  end

  private
  def new_event_params
    params.require(:event).permit(:place, :time)
  end
end
