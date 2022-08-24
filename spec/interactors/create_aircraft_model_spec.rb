# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateAircraftModel, type: :interactor do
  subject(:context) { described_class.call(permitted_params:) }

  let(:permitted_params) { { description: 'Boeing', maker: 'http://0.0.0.0/boeing.jpg' } }

  describe '#call' do
    context 'when the aircraft_model is valid' do
      it 'creates an aircraft model' do
        expect(context.aircraft_model).to be_persisted
        expect(context.aircraft_model.description).to eq('Boeing')
        expect(context.aircraft_model.maker).to eq('http://0.0.0.0/boeing.jpg')
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
