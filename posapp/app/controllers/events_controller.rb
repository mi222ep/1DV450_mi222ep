class EventsController < ApplicationController

  before_action :require_valid_apikey
  def index
    @events = Event.select('events.name, about, longitude, event_time, latitude, creators.name AS "created-by"').joins(:position, :creator).order(event_time: :asc).all
    render :json => @events
  end

  def get_single_event
    @event = Event.find_by_id(params['eventID'])
    toClient = []
    toClient.push("posapp" =>api_header)
    toClient.push("data" =>@event)
    #@a.push("footer" => api_footer)
    render :json =>toClient
  end

  def get_offset_and_limit
    a = []
    @event =Event.select('events.name, about, longitude, event_time, latitude, creators.name AS "created-by"').joins(:position, :creator).order(event_time: :asc).limit(params['limit']).offset(params['offset'])
    a.push(@event)
    render :json =>a
  end
  def api_header
    return "header: api-header"

  end
  def api_footer
    return "footer: api-footer"
  end

end