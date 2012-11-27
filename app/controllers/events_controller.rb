class EventsController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    event = params[:event]
    datetime = DateTime.new(event['time(1i)'].to_i, event['time(2i)'].to_i, event['time(3i)'].to_i, event['time(4i)'].to_i, event['time(5i)'].to_i)

    Event.create(:name => event[:name], :description => event[:description], :time => datetime)
    redirect_to :action => 'index'
  end

  def index
    @user = User.find(session[:user_id])
    @events = Event.all
    @event = Event.new
  end

  def edit
    @user = User.find(session[:user_id])
    @event = Event.find(params[:event_id])
    @eid = params[:event_id]
  end

  def update
    event_info = params[:event]
    event = Event.find(params[:event_id])
    event.name  = event_info[:name]
    event.description = event_info[:description]
    # TODO Date and time proccessing
    
    event.save
    redirect_to :action => 'index'
  end

  def delete
    event = Event.find(params[:event_id])
    event.destroy
    redirect_to :action => 'index'
  end
end
