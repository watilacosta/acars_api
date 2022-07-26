# frozen_string_literal: true

class FindAircraftModel
  include Interactor

  def call
    context.aircraft_model = find_aircraft_model
  rescue ActiveRecord::RecordNotFound => e
    context.fail!(message: e)
  end

  private

  def find_aircraft_model
    AircraftModel.find(context.permitted_params[:id])
  end
end
