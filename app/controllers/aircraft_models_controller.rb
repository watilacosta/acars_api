# frozen_string_literal: true

class AircraftModelsController < ApplicationController # :nodoc:
  def index
    result = ListAircraftModel.call

    render json: result.aircraft_models, status: :ok
  end

  def create
    result = CreateAircraftModel.call(permitted_params:)

    if result.success?
      aircraft_model = aircraft_model_serialized(result.aircraft_model)
      render json: { aircraft_model: }, status: :ok
    else
      render json: { error: result.message }, status: :unprocessable_entity
    end
  end

  def update
    result = UpdateAircraftModelOrganizer.call(permitted_params:)

    if result.success?
      aircraft_model = aircraft_model_serialized(result.aircraft_model)
      render json: { aircraft_model: }, status: :ok
    else
      render json: { error: result.error }, status: :not_found
    end
  end

  def destroy
    result = DeleteAircraftModelOrganizer.call(
      permitted_params: { id: params[:id] }
    )

    if result.success?
      render json: {}, status: :no_content
    else
      render json: { error: result.error }, status: :not_found
    end
  end

  private

  def aircraft_model_serialized(aircraft_model)
    AircraftModelSerializer.new(aircraft_model).serializable_hash
  end

  def permitted_params
    params.require(:aircraft_model).permit(:description, :maker)
          .merge(id: params[:id])
  end
end
