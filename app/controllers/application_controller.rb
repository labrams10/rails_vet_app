# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    User.find(session[:user_id])
  end

  def user_signed_in?
    true if session[:user_id]
  end
end
