class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(params[:username], params[:password])

    if user
      login_user!(user)
      redirect_to user, notice: "Successfully logged in"
    else
      redirect_to root_url, notice: "Invalid username/password combo."
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to root_url, notice: "Successfully logged out."
  end
end
