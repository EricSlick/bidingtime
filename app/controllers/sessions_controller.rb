class SessionsController < ApplicationController
  def new
    stophere = 0
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:role] = user.role
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
    end
end
