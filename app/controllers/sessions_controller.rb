# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    if user_signed_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    user.try(:authenticate, params[:user][:password])
    @user = user
    session[:user_id] = @user.id
    redirect_to user_path(@user), notice: "Thanks for signing in"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

private

  def user_params
    params[:user]
  end
end
