# frozen_string_literal: true

class AircraftModelsController < ApplicationController
  def create
    binding.pry
    CreateAircraftModel.call(aircraft_model_params:)
  end

  private

  def aircraft_model_params
    params.slice!(:name)
  end
end
