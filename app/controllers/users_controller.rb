class UsersController < ApplicationController
  def index
    @users = User.find(current_user.id)
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(email: params["email"], username: params["username"], password: params["password"])
    if @user.save
      session[:user_id] = @user.id
      # redirect_to users_path, notice: "Signup successful!"
    else
      @errors = @user.errors.full_messages
      # render :new
    end
    render json: @user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
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
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
