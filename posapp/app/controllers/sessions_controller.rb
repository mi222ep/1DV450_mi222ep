class SessionsController < ApplicationController
  def new
    if is_logged_in?
      redirect_to keys_path
    end
  end

  def authenticate
    session[:client_call] = params[:callback]
    redirect_to "/auth/twitter"
  end

  # called when a login attempt is made

  def create_for_api
    auth = request.env["omniauth.auth"]

    user = Creator.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Creator.create_with_omniauth(auth["provider"], auth["uid"])

    user.name = auth["info"]["name"] # could be updated (better check when new logins)
    user.token = auth["credentials"]["token"] # github provider token should not give out
    user.auth_token = SecureRandom.urlsafe_base64(nil, false) # generate a access_key for client to call the API
    user.token_expires = Time.now + 1.hour
    user.save

    # read back the session
    url = session[:client_call]
    session[:client_call] = nil
    redirect_to "#{url}?auth_token=#{user.auth_token}&token_expires=#{Rack::Utils.escape(user.token_expires.to_s)}"
  end

  def create
    # Getting the user by mail
    @user = User.find_by(name: params[:name])

    # check if we got a user first and then the password is correct
    if @user && @user.authenticate(params[:password])

      # call helper method log_in (se helpers/seesionhelper)
      log_in @user
      # Log the user in and redirect to the page with all teams (/teams)
      redirect_to keys_path
    else
      # Create an error message.
      #flash.now is for rendering (lives for the cycle)
      # danger is mapped in the view against bootstraps classes
      flash.now[:danger] = 'Invalid email/password combination'
      # render the layout with the form
      render 'new'
    end
  end


  # called when logout
  def destroy
    log_out # called in sessionhelper
    # flash (without .now) lives for a redirect

    flash[:info] = "Tnx for the visit, welcome back!"
    redirect_to login_path
  end

  def test
    user = get_creator_by_oauth
    if (user.nil?)
      response.status = 401
      render :nothing => true
    else
      response.status = 200
      render :json => user
    end
  end
  def destroy_api_auth
    destroy_api_authenticate
    render json: "You have logged out from the api"
  end
end
