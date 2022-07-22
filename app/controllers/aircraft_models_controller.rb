# frozen_string_literal: true

class AircraftModelsController < ApplicationController
  def create
    result = CreateAircraftModel.call(permitted_params:)

    if result.success?
      render json: { aircraft_model: result.aircraft_model }, status: :created
    else
      render json: { error: result.message }, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:aircraft_model).permit(:description, :maker)
  end
end
