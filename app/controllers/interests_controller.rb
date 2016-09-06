class InterestsController < ApplicationController

  def index
    @interests = Interest.all
    render json: @interests
  end

  def create
    @interest = Interest.find_by(name: params["interest"]["name"])
    @users = @interest.users
    render json: @users
  end

end
