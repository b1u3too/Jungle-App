class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.alert = "Error! Unable to create account: #{user.errors.full_messages}"
      redirect_to '/user/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
