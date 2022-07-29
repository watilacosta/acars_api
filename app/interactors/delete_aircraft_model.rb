# frozen_string_literal: true

class DeleteAircraftModel
  include Interactor

  def call
    context.aircraft_model.destroy!
  rescue StandardError => e
    puts e.message
    context.fail!(error: 'Could not delete aircraft model')
  end
end
