# frozen_string_literal: true

class FindAircraftModel
  include Interactor

  def call
    binding.pry
    context.aircraft_model = find_aircraft_model
  rescue ActiveRecord::RecordNotFound => e
    context.fail!(message: e.record&.errors&.full_messages&.join(', ').to_s)
  end

  private

  def find_aircraft_model
    AircraftModel.find(context.permitted_params[:id])
  end
end
