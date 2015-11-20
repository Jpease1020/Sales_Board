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

    def sales_for_display
    if current_user.salesperson?
      @sales = Sale.where('extract(month  from created_at) = ? and user_id = ?', month_variable, current_user.id).order(created_at: :desc)
    elsif current_user.assistant?
      @sales = Sale.where('extract(month  from created_at) = ?', month_variable).where(user_id: assistants_salespeople).order(created_at: :desc)
    elsif current_user.admin?
      @sales = Sale.where('extract(month  from created_at) = ?', month_variable).order(created_at: :desc)
    end
  end

  def sale_month
    month = params[:month]
    Time.now
  end

  def month_variable
    Date::MONTHNAMES.index(display_month)
  end

  def display_month
    if params[:date] == nil
      @display_month = Time.now.strftime("%B")
    else
      @display_month = params[:date][:month]
    end
  end

  def salespeople
    @salespeople = User.where(role: 1)
  end

  def assistants_salespeople
    User.where(assistant_id: current_user.id)
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

end
