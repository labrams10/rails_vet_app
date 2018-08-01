class ApplicationController < ActionController::Base
  def verify_login
    true if session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
