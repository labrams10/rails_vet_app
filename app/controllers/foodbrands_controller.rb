# frozen_string_literal: true
class FoodbrandsController < ApplicationController

  def create
    @animal = Animal.find_by(id: params[:animal_id])
    @foodbrand = @animal.foodbrands.build(foodbrand_params)
    if @foodbrand.save
      # redirect_to user_animal_path(current_user, @animal)
      respond_to do |format|
        format.json {render :json => @foodbrand.to_json(:only => [:name])}
      end
    else
      render 'animals/show'
    end

        #     if credit_app.save(validate: !autosave)
        #   generate_pdf(credit_app) unless autosave
        #   update_loan_applicants(credit_app)
        #   render json: { id: credit_app.id }, status: :ok
        # else
        #   render json: { message: credit_app.errors.full_messages.to_sentence }, status: :bad_request
        # end

  end

  private

  def foodbrand_params
    params.require(:foodbrand).permit(:name)
  end
end
