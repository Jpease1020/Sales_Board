class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :log_in, :log_out, :logged_in?, :logged_out?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    # session.delete(:user_id)
    # @current_user = nil
    session.clear
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_out?
    session[:user_id] == nil
  end

  def assistants_salespeople
    User.where(assistant_id: current_user.id)
  end



end
