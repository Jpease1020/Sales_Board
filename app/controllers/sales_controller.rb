class SalesController < ApplicationController

  def index
    # @sales = Sale.where({user_id: session[:user_id], :created_at => 1.months.ago..Time.now})#.order(created_at: :desc)
    # @sales = Sale.where({user_id: session[:user_id], created_at: strftime('%m', created_at) = ?, Time.now.month)})
    @sales = Sale.where('extract(month  from created_at) = ? and user_id = ?', Time.now.month, session[:user_id])
    # byebug
  end
end

# Sale.where(["user_id = ? and created_at = ?", session[:user_id], ])
