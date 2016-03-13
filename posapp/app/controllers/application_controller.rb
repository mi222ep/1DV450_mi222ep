class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  protect_from_forgery with: :exception

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
      redirect_to api_not_valid_key_path
    end
  end
  def get_creator_by_oauth
    auth_token = request.headers["X-auth-token"] || nil
    creator = nil
    unless auth_token.nil?
      #TODO: Test against token expiration date also
      creator = Creator.find_by_auth_token(auth_token) || nil
    end
  end
end