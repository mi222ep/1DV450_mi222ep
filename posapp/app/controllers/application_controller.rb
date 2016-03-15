class ApplicationController < ActionController::Base
  require 'errorMessage.rb'

  include SessionsHelper
  protect_from_forgery with: :exception

  OFFSET = 0
  LIMIT = 20

  def offset_params
    if params[:offset].present?
      @offset = params[:offset].to_i
    end
    if params[:limit].present?
      @limit = params[:limit].to_i
    end
    @offset ||= OFFSET
    @limit ||= LIMIT
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin
    @current_user.id == 1
  end

  def require_login
    if current_user.nil? then
      flash[:info] = "You must be logged in to visit that page"
      redirect_to login_path
    end
  end

  def require_admin_access
    if @current_user.id != 1
      flash[:info] = "You're not an admin"
      redirect_to keys_path
    end
  end

  def require_valid_apikey
    apikey = request.headers["apikey"] || nil
    if Apikey.find_by_api_key(apikey)
    else
      @error = ErrorMessage.new("Not valid api key", "Unvalid api key")
      render json: @error, status: :unauthorized
    end
  end

  def get_creator_by_oauth
    auth_token = request.headers["X-auth-token"] || nil
    creator = nil
    unless auth_token.nil?
      creator = Creator.find_by_auth_token(auth_token) || nil
    end
  end
  def api_authenticate
    @creator = get_creator_by_oauth
    if @creator.nil?
      @error = ErrorMessage.new("You need to be logged in to do that", "Not logged in")
      render json: @error, status: :unauthorized
    else
      if @creator.token_expires < Time.now
        @error = ErrorMessage.new("Auth token has expired", "Auth token expired")
        render json: @error, status: :unauthorized
      else
        #Set new expiration date for token
        @creator.token_expires = Time.now + 1.hour
      end
    end
  end
  def destroy_api_authenticate
    @creator = get_creator_by_oauth
    if @creator.nil?
    else
      @creator.token = nil
      @creator.auth_token = nil
      @creator.token_expires = nil
      @creator.save
    end
  end
end