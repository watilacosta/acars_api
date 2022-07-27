# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateAircraftModel, type: :interactor do
  subject(:context) { described_class.call(aircraft_model:, permitted_params:) }

  let(:aircraft_model) { create(:aircraft_model) }
  let(:permitted_params) do
    { description: 'Boeing', maker: 'http://teste.com/boeing.jpg' }
  end

  describe '#call' do
    context 'when the aircraft_model is valid' do
      it 'updates an aircraft model', :aggregate_failures do
        expect(context.aircraft_model).to be_persisted
        expect(context.aircraft_model.description).to eq('Boeing')
        expect(context.aircraft_model.maker).to eq('http://teste.com/boeing.jpg')
      end
    end

    context 'when the aircraft_model is invalid' do
      let(:permitted_params) { { description: '', maker: '' } }

      it 'fails with an error message' do
        expect(context.failure?).to be_truthy
        expect(context.message).to eq('Description can\'t be blank, Maker can\'t be blank')
      end
    end
  end
end
