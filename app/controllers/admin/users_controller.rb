class Admin::UsersController < Admin::BaseController

  def new
  end

  def create
    user = User.new(user_params)
    unless user.save
      flash[:error] = "The salesperson was not created, please try again"
    end
    redirect_to action: 'index'
  end

  def index
    @salespeople = User.where(role: 1)
    @assistants = User.where(role: 2)
  end

  def show
    @sale = Sale.new
    @salespeople = User.where(role: 1)
    display_month
    @sales = Sale.where('extract(month  from created_at) = ? and user_id = ?', month_variable, params[:id]).order(created_at: :desc)
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
  def user_params
    params.require(:user).permit(:name, :assistant_id, :password, :password_confirmation)
  end
end
