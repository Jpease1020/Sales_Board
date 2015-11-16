class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      redirect_to sales_path
    else
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end
