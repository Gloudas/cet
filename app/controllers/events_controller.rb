class EventsController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    event = params[:event]

    Event.create(:name => event[:name], :description => event[:description], :time => event[:time], :date => event[:date])
    redirect_to :action => 'index'
  end

  def index
    @user = User.find(session[:user_id])
    @events = Event.all
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
