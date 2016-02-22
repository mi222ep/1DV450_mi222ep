class UsersController < ApplicationController
  def index
    # @ = distansvariabel som vi sedan kan skicka till view
    @users = User.all
    render :json => @users
  end
  def new
    #@user = User.new
  end
  def register
      @user = User.new(user_params)

      if @user.save
        session[:userid] = @user.id
        redirect_to login_path
      else
        render :action => new
      end
    #Check if email is in use
    #If not, try to register
    #If register fails, return error message
    #Skicka med param username

  end
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
