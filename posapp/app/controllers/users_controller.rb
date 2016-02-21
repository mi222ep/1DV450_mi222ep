class UsersController < ApplicationController
  def index
    # @ = distansvariabel som vi sedan kan skicka till view
    @users = User.all
    render :json => @users
  end
  def new

  end
end
