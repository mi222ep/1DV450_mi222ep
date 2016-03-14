class EventsController < ApplicationController

  protect_from_forgery
  before_action :require_valid_apikey, :offset_params, only: [:index]

  respond_to :json

  def index
    events = Event.limit(@limit).offset(@offset)

    nr = Event.distinct.count(:id);
    @response = {events: events, number_of_events: nr}

    respond_with(@response)
  end
  def show
    @event = Event.find_by_id(params['id'])
    respond_with @event
  end
  def create
    @creator = get_creator_by_oauth
    if(@creator.nil?)
      response.status = 401
      render :nothing => true
    else
    @event = Event.new(event_params)
    @event.creator_id = @creator.id
    @event.save
      respond_with(@event)
    end
  end
  def update
    @creator = get_creator_by_oauth
    if(@creator.nil?)
      response.status = 401
      render :json => "Not logged in"
    else
    @event = Event.find_by_id_and_creator_id(params["id"], @creator.id) || nil
    if(@event.nil?)
      response.status = 401
      render :json => "Cannot find event with that ID"
    else
    @event.update(name: params["name"], about: params["about"], position_id: params["position_id"], event_time: params["event_time"]);
    respond_with(@event)
    end
    end
    end
  def destroy
    @creator = get_creator_by_oauth
    if(@creator.nil?)
      response.status = 401
      render :json => "Not logged in"
    else
    @event = Event.find_by_id_and_creator_id(params["id"], @creator.id) || nil
    if(@event.nil?)
      #TODO: Set response.status
      render :json => "Cannot delete that event"
    else
      @event.delete
      respond_with(@event)
    end
      end
  end
  def event_params
    params.permit(:name, :about, :event_time, :position_id)
  end
    end
