class MessageController < ApplicationController
  def not_valid_key
    @arr = []
    @arr.push("Sorry. Not valid api key")
    render :json=>@arr
  end
end
