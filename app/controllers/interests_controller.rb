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
    @users_without_current_user = @users.where.not(id: session[:user_id])
    render json: @users_without_current_user
  end

end
