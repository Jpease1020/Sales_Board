class SalesController < ApplicationController

  def index
    @sale = Sale.new
    @months = ["January", "February", "March", "April"]
    session[:month] = params[:month] if params[:month]
    month_variable = session[:month] || Time.now.month
    @sales = Sale.where('extract(month  from created_at) = ? and user_id = ?', month_variable, session[:user_id]).order(created_at: :desc)
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to action: 'index'
    else
      flash[:alert] = "sale not saved please enter all the information correctly"
      redirect_to action: 'index'
    end
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

  def destroy
    sale = Sale.find(params[:id])
    sale.destroy
  end


  private

  def sale_params
    params.require(:sale).permit( :user_id, :pages, :quantity, :job_title,
                                  :job_type, :amount, :customer, :mark_up,
                                  :frequency, :single_sale)
  end

  def sale_month
    month = params[:month]
    Time.now
  end
end
