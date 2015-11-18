class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
    @sale = Sale.new
    @user = User.find(params[:id])
    salespeople
    @sales = Sale.where('extract(month  from created_at) = ? and user_id = ?', month_variable, params[:id]).order(created_at: :desc)
  end

  private
  def user_params
    params.permit(:user).require(:name, :password, :password_confirmation)
  end

end
