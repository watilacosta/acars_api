require 'rails_helper'

RSpec.describe 'AircraftModels', type: :request do
  let(:user) { create(:user) }
  let(:params) do
    {
      user_id: user.id,
      user_query: {
        user: user.email,
        pass: '123456',
        auth: 'auth',
        ver: '1.0',
        lat: '0.0',
        lon: '0.0',
        eqpt: 'B738'
      }
    }
  end

  describe 'GET /index' do
    before do
      get api_version1_user_query_path, params: params
    end

    context 'when user exists' do
      it 'returns body USEROK' do
        expect(response.body).to eq('USEROK')
      end
    end

    context 'when user does not exist' do
      let(:params) do
        {
          user_id: 0,
          user_query: {
            user: 'email@teste.com',
            pass: '123456',
            auth: 'auth',
            ver: '1.0',
            lat: '0.0',
            lon: '0.0',
            eqpt: 'B738'
          }
        }
      end

      it 'returns body NOUSER' do
        expect(response.body).to eq('NOUSER')
      end

      it 'ActiveRecord::RecordNotFound' do
        expect { User.find(0) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
