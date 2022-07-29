# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeleteAircraftModel, type: :interactor do
  describe '.call' do
    let(:aircraft_model) { create(:aircraft_model) }

    context 'when the aircraft model is deleted' do
      it 'succeeds' do
        result = DeleteAircraftModel.call(aircraft_model: aircraft_model)
        expect(result.success?).to eq(true)
      end
    end

    context 'when the aircraft model is not deleted' do
      it 'fails' do
        allow(aircraft_model).to receive(:destroy!).and_raise(ActiveRecord::RecordInvalid)
        result = DeleteAircraftModel.call(aircraft_model: aircraft_model)
        expect(result.success?).to eq(false)
        expect(result.error).to eq('Could not delete aircraft model')
      end
    end
  end
end
