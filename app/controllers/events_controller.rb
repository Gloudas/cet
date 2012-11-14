class EventsController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @event = params[:event]
    Event.create(:name => @event[:name], :description => @event[:description], :time => @event[:time], :date => @event[:date])
    redirect_to :action => 'index'
  end

  def index
    @user = User.find(session[:user_id])
    @events = Event.all
  end

end
