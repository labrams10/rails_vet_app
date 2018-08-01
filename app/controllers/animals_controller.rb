class AnimalsController < ApplicationController

  def index
    @animals = User.find_by(params[:id]).animals
  end

  def new
    @animal = Animal.new
  end
end
