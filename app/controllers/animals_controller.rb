# frozen_string_literal: true

class AnimalsController < ApplicationController
  def index
    @animals = Animal.users_animals(current_user)
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = current_user.animals.build(animal_params)
    if @animal.save
      redirect_to user_animals_path(current_user)
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find_by(id: params[:id])
  end

  def show
    @animal = Animal.find_by(id: params[:id])
  end

private

  def animal_params
    params.require(:animal).permit(:name, :breed, :age, :description, :weight)
  end
end
