require 'rails_helper'

RSpec.describe 'AircraftModels', type: :request do
  let(:rating) { create(:rating) }
  let(:user) { create(:user, rating:) }
  let(:params) do
    {
      user: user.email,
      pass: '123456',
      auth: 'auth',
      ver: '1.0',
      lat: '0.0',
      lon: '0.0',
      eqpt: 'B738'
    }
  end

  describe 'GET /index' do
    before { get api_version1_user_query_path, params: }

    context 'when user exists' do
      it 'returns body USEROK' do
        expect(response.body).to eq('USEROK')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user does not exist' do
      let(:params) do
        {
          user: '',
          pass: '123456',
          auth: 'auth',
          ver: '1.0',
          lat: '0.0',
          lon: '0.0',
          eqpt: 'B738'
        }
      end

      it 'returns body NOUSER' do
        expect(response.body).to eq('NOUSER')
      end

      it 'ActiveRecord::RecordNotFound' do
        expect { User.find_by!(email: '') }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
