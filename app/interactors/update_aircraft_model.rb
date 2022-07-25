# frozen_string_literal: true

class UpdateAircraftModel
  include Interactor

  def call
    update!
  rescue ActiveRecord::RecordInvalid => e
    context.fail!(message: e.record&.errors&.full_messages&.join(', ').to_s)
  end

  private

  def update!
    binding.pry
    AircraftModel.update!(context.aircraft_model)
  end
end
