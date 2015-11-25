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
    session.clear
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_out?
    session[:user_id] == nil
  end

  def month_variable
    Date::MONTHNAMES.index(display_month)
  end

  def display_month
    if params[:date] == nil
      Time.now.strftime("%B")
    else
      params[:date][:month]
    end
  end
  # def sale_month
  #   month = params[:month]
  #   Time.now
  # end

  def salespeople
    @salespeople = User.where(role: 1)
  end



  def assistants_salespeoples_names
    @names = assistants_salespeople.pluck(:name)
  end

  def user_for_new_sale_dropdown
    if current_user.admin?
      User.find_by(id: params[:id]).name
    else
      current_user.name
    end
  end

  def user_home_page
    if current_user && current_user.admin?
      admin_home_path
    elsif current_user
      sales_path
    end
  end
end
