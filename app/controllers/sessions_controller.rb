class SessionsController < ApplicationController
  def new
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
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end
