# frozen_string_literal: true

module Interactors
  class CreateAircraftModel
    include Interactor

    def call
      context.fail! unless AircraftModel.create!(context.aircraft_model_params)
    end
  end
end
