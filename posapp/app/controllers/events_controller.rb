class EventsController < ApplicationController
  protect_from_forgery
  before_action :require_valid_apikey
  before_action :offset_params, only: [:index]
  before_action :api_authenticate, only: [:create, :update, :destroy]
  require 'errorMessage.rb'
  respond_to :json

  def get_by_tag
    @tag = Tag.find_by_id(params["id"]) || nil
    if @tag.nil?
      @error = ErrorMessage.new("Could not find that resource. Are you using the right tag_id?", "The Tag was not found!" )
      render json:  @error, status: :not_found
    else
      @events = @tag.events
      @response = {tag: @tag, events_with_tag: @events}
      render json: @response
    end
  end
  def index
    events = Event.order(event_time: :dsc).limit(@limit).offset(@offset)
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
      if params["tag"]
        @tag = Tag.find_by_name(params["tag"]) || Tag.new(name: params["tag"])
        @event.tags << @tag
      end
      respond_with(@event)
    else
      error = ErrorMessage.new("Could not create the resource. Bad parameters?", "Could not create the resource!" )
      render json: error, status: :bad_request
    end
    end
  end
  def update
    if Event.find_by_id(params["id"]).nil?
      @error = ErrorMessage.new("The event could not be found. Correct event_id?", "Could not find the resource!" )
      render json: @error, status: :bad_request
    else
      @event = Event.find_by_id_and_creator_id(params["id"], @creator.id) || nil
        if @event.nil?
          @error = ErrorMessage.new("Current user does'nt seem to be the owner of this resource", "Could not find the resource!" )
          render json: @error, status: :bad_request
        else
          if @event.update(name: params["name"], about: params["about"], position_id: params["position_id"], event_time: params["event_time"]);
            @event = Event.find_by_id(params["id"])
            render json: @event, status: :ok, location: events_path(@event)
          else
            @error = ErrorMessage.new("Could not update the resource. Bad parameters?", "Could not update the resource!" )
            render json: @error, status: :bad_request
          end
        end
    end
  end
  def destroy
    if Event.find_by_id(params["id"])
      @event = Event.find_by_id_and_creator_id(params["id"], @creator.id) || nil
      if @event.nil?
        @error = ErrorMessage.new("Could not find that event", "Event could not be found" )
        render json: @error, status: :not_found
      else
        if @event.destroy
          @response = {removed_event: @event}
          render json: @event
        else
          @error = ErrorMessage.new("You don't have the authority to delete that event", "Event cant be deleted")
          render json: @error, status: :unauthorized
        end
      end
    else
      @error = ErrorMessage.new("Could not fint the event", "Event cant be found")
      render json: @error, status: :bad_request
    end
  end
  def event_params
    params.permit(:name, :about, :event_time, :position_id)
  end
    end