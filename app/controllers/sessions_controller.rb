class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.alert = "invalid credentials, try again"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to '/login', notice: 'You have logged out'
  end
end
