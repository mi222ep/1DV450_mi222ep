class UsersController < ApplicationController
  def index
    # @ = distansvariabel som vi sedan kan skicka till view
    @users = User.all
    render :json => @users
  end
  def new

  end
  def register
    #Skicka med param username
    redirect_to login_path
  end
end
