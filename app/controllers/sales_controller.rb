class SalesController < ApplicationController

  def index
    display_month
    salespeople
    @sale = Sale.new

    assistants_salespeoples_names
    sales_for_display
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
    @salespeople = User.where(role: 1)
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
    redirect_to :back
  end


  private

  def sale_params
    params.require(:sale).permit( :user_id, :pages, :quantity, :job_title,
                                  :job_type, :customer, :mark_up,
                                  :frequency, :single_sale)
  end

end
