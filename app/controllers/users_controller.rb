class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  #respond_to :json, :html

  def index
    @users = User.find(current_user.id)
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Account was successfully created.'
      redirect_to @user
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
    # render json: @user
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    if current_user
      @user = User.find(current_user.id)
      @user.update_attributes(user_params, password: params["password"])
      redirect_to user_path(@user.id)
    else
      redirect_to new_session_path, alert: "You must be logged in to make this change."
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to root_path
  end

  def search
    @interest = Interest.find_by(name: params["interest"])
    @users = @interest.users.where(zipcode: params["zipcode"])
    render json: @users
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
