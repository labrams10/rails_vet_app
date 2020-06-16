# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    if user_signed_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def show; end

  def create
    if passwords_match?
      @user = User.create!(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def passwords_match?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
