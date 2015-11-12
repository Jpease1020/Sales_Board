class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:id] = user.id
      redirect_to sales_path
    else
      render "new"
    end
  end

end
