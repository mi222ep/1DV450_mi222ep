class EventsController < ApplicationController

  def index
    @events = Event.select('events.name, about, longitude, event_time, latitude, creators.name AS "created-by"').joins(:position, :creator).order(event_time: :asc).all
    render :json => @events
  end

end