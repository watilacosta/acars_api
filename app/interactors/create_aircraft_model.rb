# frozen_string_literal: true

class CreateAircraftModel
  include Interactor

  def call
    context.aircraft_model = create_aircraft_model
  rescue ActiveRecord::RecordInvalid => e
    context.fail!(message: e.record.errors.full_messages.join(', ').to_s)
  end

  private

  def create_aircraft_model
    AircraftModel.create!(context.permitted_params)
  end
end
