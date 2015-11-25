class Admin::WelcomeController < Admin::BaseController
  def home
    @goal = params[:goal]
    @sale = Sale.new
    @sales = sales_for_display
    @salespeople = User.where(role: 1)
    @display_month = display_month
    selected_month_frequency_list = Sale.where('extract(month  from created_at) = ?',
                              month_variable).pluck(:frequency).uniq.sort
    @sales_by_frequency =  selected_month_frequency_list.map do |frequency|
      Sale.where('extract(month from created_at) = ? and frequency = ?', month_variable, frequency)
    end
    salespeople
    @business_days = (Date.today.at_beginning_of_month..Date.today.at_end_of_month).count {|day| day unless day.saturday? || day.sunday? }
    @daily_goal = @goal.to_i / @business_days
    @work_days_so_far = (Date.today.at_beginning_of_month..Date.today).count {|day| day unless day.saturday? || day.sunday? }
    @month_to_date_sales_goal = @daily_goal * @work_days_so_far
    @sales_to_date = Sale.where('extract(month  from created_at) = ?', month_variable).order(created_at: :desc).sum(:single_sale)
    @sale_vs_goal = (@goal.to_i * -1) + @sales_to_date
  end
end










# @sales.where(job_type: "digital").sum("single_sale * frequency"), :precision => 0)
#
# if current_user.salesperson?
#   @sales = Sale.where('extract(month  from created_at) = ? and user_id = ?', month_variable, current_user.id).order(created_at: :desc)
# elsif current_user.assistant?
#   @sales = Sale.where('extract(month  from created_at) = ?', month_variable).where(user_id: assistants_salespeople).order(created_at: :desc)
# elsif current_user.admin?
#   @sales = Sale.where('extract(month  from created_at) = ?', month_variable).order(created_at: :desc)
