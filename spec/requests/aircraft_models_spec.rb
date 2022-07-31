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
      before { post aircraft_models_path, params: { aircraft_model:} }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'creates a new aircraft model' do
        expect(AircraftModel.count).to eq(1)
      end

      it 'returns the corrects aircraft model attributes', :aggregate_failures do
        description = json['aircraft_model']['data']['attributes']['description']
        maker       = json['aircraft_model']['data']['attributes']['maker']

        expect(description).to eq(aircraft_model[:description])
        expect(maker).to eq(aircraft_model[:maker])
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

  describe 'PUT /update' do
    let(:aircraft_model) { create(:aircraft_model) }
    let(:aircraft_model_attributes) do
      { description: 'Test', maker: 'Test', id: aircraft_model.id }
    end

    context 'when the request is valid' do
      before do
        put aircraft_model_path(aircraft_model),
            params: { aircraft_model: aircraft_model_attributes }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'updates the aircraft model' do
        description = AircraftModel.find(aircraft_model.id).description
        expect(description).to eq(aircraft_model_attributes[:description])
      end

      it 'returns the corrects aircraft model attributes', :aggregate_failures do
        description = json['aircraft_model']['data']['attributes']['description']
        maker       = json['aircraft_model']['data']['attributes']['maker']

        expect(description).to eq(aircraft_model_attributes[:description])
        expect(maker).to eq(aircraft_model_attributes[:maker])
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { description: 'Test' } }
      before do
        put aircraft_model_path(id: 0),
            params: { aircraft_model: invalid_attributes }
      end

      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:not_found)
      end

      it 'does not update the aircraft model' do
        description = AircraftModel.find(aircraft_model.id).description
        expect(description).to_not eq(invalid_attributes[:description])
      end

      it 'returns the error message' do
        expect(json['error']).to include("Couldn't find AircraftModel with 'id'=0")
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when the request is valid' do
      before do
        aircraft_model = create(:aircraft_model)

        delete aircraft_model_path(aircraft_model),
               params: { aircraft_model: { id: aircraft_model.id } }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'deletes the aircraft model' do
        expect(AircraftModel.count).to eq(0)
      end
    end

    context 'when the request is invalid' do
      before do
        create(:aircraft_model)
        delete aircraft_model_path(0), params: { aircraft_model: { id: 0 } }
      end

      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:not_found)
      end

      it 'does not delete the aircraft model' do
        expect(AircraftModel.count).to eq(1)
      end
    end
  end
end
