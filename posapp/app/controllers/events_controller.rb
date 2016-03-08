class EventsController < ApplicationController

  def index
    @events = Event.select('events.name, about, longitude, latitude, creators.name AS "created-by"').joins(:position, :creator).order(name: :asc).all
    render :json => @events
  end

end