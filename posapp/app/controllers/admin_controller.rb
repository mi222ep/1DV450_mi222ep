class AdminController < ApplicationController
  before_action :require_login, :require_admin_access
  def show
    @apikey = Apikey.all
  end

  def delete
    Apikey.find(params[:id]).delete
    flash[:info] ="Deleted"
    redirect_to admin_path
  end
end