class EventsController < ApplicationController

  def index
    @events = Event.select('events.name, longitude, creators.name AS "Creator name"').joins(:position, :creator).all
    render :json => @events
  end

end