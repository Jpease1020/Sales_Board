class Admin::WelcomeController < Admin::BaseController
  def home
    @sale = Sale.new
    @sales = sales_for_display
    @salespeople = User.where(role: 1)
    @display_month = display_month
  end
end
