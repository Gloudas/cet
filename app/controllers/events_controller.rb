class EventsController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    event = params[:event]
    startTime = DateTime.new(event['startTime(1i)'].to_i, event['startTime(2i)'].to_i, event['startTime(3i)'].to_i, event['startTime(4i)'].to_i, event['startTime(5i)'].to_i)
    endTime = DateTime.new(event['endTime(1i)'].to_i, event['endTime(2i)'].to_i, event['endTime(3i)'].to_i, event['endTime(4i)'].to_i, event['endTime(5i)'].to_i)
    
    Event.create!(:name => event[:name], :description => event[:description], :location => event[:location], :startTime => startTime, :endTime => endTime, :school_id => @user.school)
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
    event.location = event_info[:location]
    startTime = DateTime.new(event_info['startTime(1i)'].to_i, event_info['startTime(2i)'].to_i, event_info['startTime(3i)'].to_i, event_info['startTime(4i)'].to_i, event_info['startTime(5i)'].to_i)
    endTime = DateTime.new(event_info['endTime(1i)'].to_i, event_info['endTime(2i)'].to_i, event_info['endTime(3i)'].to_i, event_info['endTime(4i)'].to_i, event_info['endTime(5i)'].to_i)
    event.startTime = startTime
    event.endTime = endTime
    event.save
    redirect_to :action => 'index'
  end

  def delete
    event = Event.find(params[:event_id])
    event.destroy
    redirect_to :action => 'index'
  end
end
