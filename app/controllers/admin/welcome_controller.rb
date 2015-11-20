class Admin::WelcomeController < Admin::BaseController
  def home
    @sale = Sale.new
    @sales = sales_for_display
    @salespeople = User.where(role: 1)
    @display_month = display_month
    @sales_by_frequency
      #make a collection of sales by frequency
      #iterate through summing up data about each sale type
      selected_month_frequency_list = Sale.where('extract(month  from created_at) = ?',
                              month_variable).order(created_at: :desc).pluck(:frequency)
      @sales_by_frequency =  selected_month_frequency_list.map do |frequency|
        Sale.where('extract(month  from created_at) = ? and frequency = ?', month_variable, frequency).order(created_at: :desc)
      end
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
