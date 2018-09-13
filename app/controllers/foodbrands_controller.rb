# frozen_string_literal: true

class FoodbrandsController < ApplicationController
  def create
    @animal = Animal.find_by(id: params[:animal_id])
    @foodbrand = @animal.foodbrands.build(foodbrand_params)
    if @foodbrand.save
      respond_to do |format|
        format.json { render json: @foodbrand.to_json(only: [:name]) }
      end
    else
      render "animals/show"
    end
  end

private

  def foodbrand_params
    params.require(:foodbrand).permit(:name)
  end
end
