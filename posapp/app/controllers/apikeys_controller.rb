class ApikeysController < ApplicationController
  before_action :require_login

  def show
    @apikey = Apikey.where(:user_id => @current_user)
  end

  def new
    @apikey = Apikey.new
  end

  def create
    @apikey = Apikey.new(apikeys_params)

    random_string = SecureRandom.uuid
    @apikey.api_key = random_string
    @apikey.user_id = @current_user.id

    if @apikey.save
      redirect_to keys_path

    else render :action => "new"
    end
  end

  def delete
    if Apikey.exists?(params[:id])
      if Apikey.find(params[:id]).user_id == @current_user.id
        Apikey.find(params[:id]).delete
        flash[:info] ="Application deleted"
      else
        flash[:info] ="You cannot delete someone elses application"
      end
      else
        flash[:info] ="That application does not seem to exist"
    end
    redirect_to keys_path
  end

  private
  def apikeys_params
    params.require(:apikey).permit(:name, :about)
  end
end