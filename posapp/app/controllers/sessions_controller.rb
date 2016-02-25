class SessionsController < ApplicationController
  def new
  if is_logged_in?
    redirect_to keys_path
  end
  end

  # called when a login attempt is made
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
end
