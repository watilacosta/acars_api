# frozen_string_literal: true

class ListAircraftModel
  include Interactor

  def call
    context.aircraft_models = serialized_aircraft_models
  end

  private

  def serialized_aircraft_models
    AircraftModelSerializer.new(AircraftModel.all).serializable_hash
  end
end
