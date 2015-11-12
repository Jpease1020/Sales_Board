class SalesController < ApplicationController

  def index
    @sales = Sale.where(user_id: session[:id])
  end
end
