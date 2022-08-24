# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FindAircraftModel, type: :interactor do
  subject(:context) { described_class.call(permitted_params:) }

  let(:permitted_params) { { id: aircraft_model.id } }

  let(:aircraft_model) { create(:aircraft_model) }

  describe '#call' do
    context 'when the aircraft_model is valid' do
      it 'creates an aircraft model' do
        expect(context.aircraft_model).to be_persisted
        expect(context.aircraft_model.id).to eq(aircraft_model.id)
      end
    end

    context 'when the aircraft_model is invalid' do
      let(:permitted_params) { { id: 0 } }

      it 'fails with an error message' do
        expect(context.failure?).to be_truthy
        expect(context.error).to eq("Couldn't find AircraftModel with 'id'=0")
      end
    end
  end
end
