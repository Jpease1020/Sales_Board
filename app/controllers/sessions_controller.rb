class SessionsController < ApplicationController
  def new
    @users = User.all
    if current_user
      redirect_to  user_home_page
    end

  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      if user.role < 3
        redirect_to sales_path
      else
        redirect_to admin_home_path
      end
    else
      flash[:danger] = "Invalid login info"
      redirect_to '/'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to '/'
  end

end
