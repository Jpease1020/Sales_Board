class Admin::DisplayController < Admin::BaseController
  def index
    @sale = Sale.new
    @daily_goal = params[:goal] || 0
    @sales_output = SalesPresenter.new(params, current_user)
    @monthly_goal = @daily_goal.to_i * @sales_output.business_days  
    @month_to_date_sales_goal = @daily_goal.to_i * @sales_output.work_days_so_far
    @sale_vs_goal = (@daily_goal.to_i * -1) + @sales_output.sales_to_date
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
