# frozen_string_literal: true

class UpdateAircraftModelOrganizer
  include Interactor::Organizer

  organize FindAircraftModel, UpdateAircraftModel
end
