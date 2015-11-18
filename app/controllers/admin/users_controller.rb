class Admin::UsersController < Admin::BaseController

  def new
  end

  def create
  end

  def index
    @salespeople = User.where(role: 1)
    @assistants = User.where(role: 2)
  end

  def show
    display_month
    @names = assistants_salespeople.pluck(:name)
    @sales = Sale.where('extract(month  from created_at) = ? and user_id = ?', month_variable, params[:id]).order(created_at: :desc)
    @sale = Sale.new
    @salespeople = User.where(role: 1)
    @user = User.find_by(id: params[:id])
  end

  def edit
    @assistants = User.where(role: 2)
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(update_user_params)
    redirect_to admin_users_path
  end

  def delete
  end

  private
  def update_user_params
    params.require(:user).permit(:name, :email, :assistant_id, :password, :password_confirmation)
  end
end
