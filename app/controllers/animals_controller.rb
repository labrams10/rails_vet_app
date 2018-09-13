# frozen_string_literal: true

class AnimalsController < ApplicationController
  before_action :set_animal, except: %i[new index]

  def index
    @animals = Animal.users_animals(current_user)

    respond_to do |format|
      format.html { render "animals/index" }
      format.json { render json: @animals.to_json(only: [:name]) }
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

  def next_show
    @animal = Animal.find_by(id: params[:id])
    @foodbrand = Foodbrand.new

    respond_to do |format|
      format.json do
        render json: @animal.to_json(only: %i[name description weight],
                                     include: [foodbrand: { only: [:name] }])
      end
    end
  end

  def show
    @animal = Animal.find_by(id: params[:id])
    @next_animal = next_or_previous_animal_for(@animal)
    @foodbrand = Foodbrand.new
  end

private

  def animal_params
    params.require(:animal).permit(:name, :breed, :age, :description, :weight)
  end

  def set_animal
    @animal = Animal.find(params[:user_id])
  end

  def next_or_previous_animal_for(current_animal)
    users_animals = Animal.where(user: current_user)
    users_animals.find_by(
      "id > :current_animal_id",
      current_animal_id: current_animal.id
    ) || users_animals.first
  end
end
