class AnimalsController < ApplicationController

  def index
    @animals = User.find_by(id: current_user.id).animals
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = current_user.animals.build(animal_params)
    redirect_to user_animals_path(current_user)
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :breed, :age)
  end
end
