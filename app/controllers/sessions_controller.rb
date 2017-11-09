class SessionsController < ApplicationController
  include ApplicationHelper

  def new
  end

  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Welcome! You have been logged in'
    else
      redirect_to login_path, alert: 'Sorry, there was an error'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You have been logged out successfully'
  end

  def auth_failure
    redirect_to root_path
  end
end
