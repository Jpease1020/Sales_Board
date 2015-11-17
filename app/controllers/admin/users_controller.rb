class Admin::UsersController < Admin::BaseController

  def new
  end

  def create
  end

  def index
    @salespeople = User.where(role: 1)
  end

  def show
  end

  def edit
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
