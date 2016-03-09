class EventsController < ApplicationController

  before_action :require_valid_apikey
  def index
    @events = Event.select('events.name, about, longitude, event_time, latitude, creators.name AS "created-by"').joins(:position, :creator).order(event_time: :asc).all
    render :json => @events
  end

  def get_single_event
    @event = Event.find_by_id(params['eventID'])
    render :json =>@event
  end

  def get_offset_and_limit
    @event =Event.select('events.name, about, longitude, event_time, latitude, creators.name AS "created-by"').joins(:position, :creator).order(event_time: :asc).all
    render :json =>@event.limit(params['limit']).offset(params['offset'])
  end

end