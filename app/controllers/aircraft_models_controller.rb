# frozen_string_literal: true

class AircraftModelsController < ApplicationController # :nodoc:
  before_action :aircraft_model, only: [:update]

  def index
    aircraft_models = AircraftModelSerializer.new(AircraftModel.all).serializable_hash

    render json: aircraft_models, status: :ok
  end

  def create
    result = CreateAircraftModel.call(permitted_params:)

    if result.success?
      render json: { aircraft_model: result.aircraft_model }, status: :ok
    else
      render json: { error: result.message }, status: :unprocessable_entity
    end
  end

  def update
    UpdateAircraftModel.call(aircraft_model:)

    render json: { aircraft_model: }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  private

  def aircraft_model
    AircraftModel.find(params[:id])
  end

  def permitted_params
    params.require(:aircraft_model).permit(:description, :maker, :id)
  end
end
