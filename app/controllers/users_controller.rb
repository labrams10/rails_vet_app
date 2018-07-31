class UsersController < ApplicationController

  def index
  end

  def show
    if verify_login
      @user = User.find_by_id(params[:id])
      if params[:pet_id]
        @pet = Pet.find_by_id(params[:pet_id])
      end
    end
  end

  def pet
  end
end
