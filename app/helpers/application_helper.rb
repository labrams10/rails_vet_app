# frozen_string_literal: true

module ApplicationHelper
  def current_user
    User.find(session[:user_id])
  end

  def user_signed_in?
    true if session[:user_id]
  end

  def form_errors_for(object = nil)
    render("shared/form_errors", object: object) unless object.blank?
  end
end
