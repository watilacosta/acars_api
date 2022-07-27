# frozen_string_literal: true

class DeleteAircraftModelOrganizer
  include Interactor::Organizer

  organize FindAircraftModel, DeleteAircraftModel
end
