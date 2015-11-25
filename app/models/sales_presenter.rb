class SalesPresenter < ActiveRecord::Base

  attr_reader :params, :current_user

  def initialize(params, current_user = nil)
    @params = params
    @current_user = current_user
  end

  def sales
    sales = Sale.where('extract(month  from created_at) = ?', month_variable)
    if current_user.salesperson?
      Sale.where('extract(month  from created_at) = ? and user_id = ?', month_variable, current_user.id).order(created_at: :desc)
    elsif current_user.assistant?
      sales.where(user_id: assistants_salespeople).order(created_at: :desc)
    elsif current_user.admin?
      sales.order(created_at: :desc)
    end
  end

  def salespeople
    User.where(role: 1)
  end

  def assistants_salespeople
    User.where(assistant_id: current_user.id)
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

  def business_days
    (Date.today.at_beginning_of_month..Date.today.at_end_of_month).count {|day| day unless day.saturday? || day.sunday? }
  end

  def work_days_so_far
    (Date.today.at_beginning_of_month..Date.today).count {|day| day unless day.saturday? || day.sunday? }
  end

  def selected_month_frequency_list
    Sale.where('extract(month  from created_at) = ?',
                            month_variable).order(created_at: :desc).pluck(:frequency)
  end

  def sales_by_frequency
     selected_month_frequency_list.map do |frequency|
      Sale.where('extract(month  from created_at) = ? and frequency = ?', month_variable, frequency).order(created_at: :desc)
    end
  end

  def sales_to_date
     Sale.where('extract(month  from created_at) = ?', month_variable).order(created_at: :desc).sum(:single_sale)
  end

end
