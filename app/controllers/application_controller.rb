class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  def set_current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_logged_in
    if @current_user.blank?
      redirect_to root_path, notice: 'Not logged in user'
    end
  end
end
