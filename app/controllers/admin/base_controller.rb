class Admin::BaseController < ApplicationController
  before_action :authorized?

  def authorized?
    if current_user.nil? || !current_user.admin?
      flash[:warning] = "Sorry but you are not authorized to view that page"
      log_out
      redirect_to '/'
    end
  else
    true
  end

end
