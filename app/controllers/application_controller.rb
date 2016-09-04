class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protect_from_forgery with: :null_sessions

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if !current_user
      redirect_to login_path, notice: "You must be signed in to do that!"
    end
  end

  helper_method :current_user, :authenticate_user
end
