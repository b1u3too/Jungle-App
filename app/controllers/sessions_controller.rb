class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    #if user exists and password is correct
    if user && user.authenticate(params[:password])
      #set a cookie containing the user id
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.alert = "Invalid credentials provided"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to '/login', notice: 'You have logged out'
  end
end
