# frozen_string_literal: true

class AnimalsController < ApplicationController
  before_action :set_animal

  def index
    @animals = Animal.users_animals(current_user)

    respond_to do |format|
      format.html {render 'animals/index'}
      format.json {render :json => @animals.to_json(:only => [:name])}
    end
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

  def update
  end

  def show
    @animal = Animal.find_by(id: params[:id])
    @foodbrand = Foodbrand.new
  end

private

  def animal_params
    params.require(:animal).permit(:name, :breed, :age, :description, :weight)
  end

  def set_animal
    @animal = Animal.find(params[:user_id])
  end
end
