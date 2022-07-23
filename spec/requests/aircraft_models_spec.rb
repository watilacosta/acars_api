# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AircraftModels', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get aircraft_models_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    let(:aircraft_model) { { description: 'Test', maker: 'Test' } }

    context 'when the request is valid' do
      before { post aircraft_models_path, params: { aircraft_model: aircraft_model } }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'creates a new aircraft model' do
        expect(AircraftModel.count).to eq(1)
      end

      it 'returns the created aircraft model' do
        expect(json['aircraft_model']).to include_json(aircraft_model)
      end

      it 'returns the created aircraft model with the correct maker' do
        expect(json['aircraft_model']['maker']).to eq(aircraft_model[:maker])
      end

      it 'returns the created aircraft model with the correct description' do
        expect(json['aircraft_model']['description']).to eq(aircraft_model[:description])
      end
    end

    context 'when the request is invalid' do
      before { post aircraft_models_path, params: { aircraft_model: { description: 'Test' } } }

      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a new aircraft model' do
        expect(AircraftModel.count).to eq(0)
      end

      it 'returns the error message' do
        expect(json['error']).to include('Maker can\'t be blank')
      end
    end
  end
end
