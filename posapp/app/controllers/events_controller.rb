class EventsController < ApplicationController
  require 'errorMessage.rb'
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
    @event = Event.find(params['id'])
    respond_with @event, location: events_path(@event)

  rescue ActiveRecord::RecordNotFound
    @error = ErrorMessage.new("Could not find that resource. Are you using the right event_id?", "The Event was not found!" )
    respond_with  @error, status: :not_found
  end
  def create
    @creator = get_creator_by_oauth
    if(@creator.nil?)
      response.status = 401
      render :nothing => true
    else
    @event = Event.new(event_params)
    @event.creator_id = @creator.id
    if @event.save
      respond_with(@event)
    else
      error = ErrorMessage.new("Could not create the resource. Bad parameters?", "Could not create the resource!" )
      respond_with error, status: :bad_request
    end
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
    if @event.update(name: params["name"], about: params["about"], position_id: params["position_id"], event_time: params["event_time"]);
      respond_with(@event)
    else
      error = ErrorMessage.new("Could not create the resource. Bad parameters?", "Could not create the resource!" )
      respond_with error, status: :bad_request
    end
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
      error = ErrorMessage.new("Could not find that event", "Event could not be found" )
    respond_with error, status: :not_found
      if @event.delete
        respond_with(@event)
      else
        error = ErrorMessage.new("You don't have the authority to delete that event", "Event cant be deleted")
        respond_with error, status: :unauthorized
      end
    end
      end
  end
  def event_params
    params.permit(:name, :about, :event_time, :position_id)
  end
    end