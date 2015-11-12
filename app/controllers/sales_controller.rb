class SalesController < ApplicationController

  def index
    @sales = Sale.where('extract(month  from created_at) = ? and user_id = ?', Time.now.month, session[:user_id])
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    sale = Sale.find(params[:id])
    if sale.update_attributes(sale_params)
      redirect_to sales_path
    else
      render "edit"
    end
  end



  private

  def sale_params
    params.require(:sale).permit( :user_id, :pages, :quantity, :job_title,
                                  :job_title, :amount, :customer, :mark_up,
                                  :frequency, :single_sale)
  end

  def sale_month
    month = params[:month]
    Time.now
  end
end
