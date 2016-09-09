class InterestsController < ApplicationController

  def index
    @interests = Interest.all
    render json: @interests
  end

  def create
    @user = User.find(session[:user_id])
    p @user.zipcode
    @interest = Interest.find_by(name: params["interest"]["name"])
    @users = @interest.users.where(zipcode: @user.zipcode )
    render json: @users
  end

end
