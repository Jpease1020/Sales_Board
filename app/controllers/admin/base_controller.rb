class Admin::BaseController < ApplicationController
  before_action :authorized?

  def authorized?
    if current_user.nil? || !current_user.admin?
      render :text => "Stop!", :status => 401
    end
  else
    true
  end

end
