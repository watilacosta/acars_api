# frozen_string_literal: true

class CreateAircraftModel
  include Interactor

  def call
    aircraft_model = AircraftModel.create!(context.permitted_params)

    context.aircraft_model = aircraft_model
  rescue ActiveRecord::RecordInvalid => e
    context.fail!(message: e.record.errors.full_messages.join(', ').to_s)
  end
end
