require 'rails_helper'

RSpec.describe CreateFsacarsConnection, type: :interactor do
  subject(:context) { described_class.call(params: params) }

  let(:user) { create(:user) }
  let(:params) do
    {
      user_id: user.id,
      user_query: {
        user: user.email,
        pass: 'pass',
        auth: 'auth',
        ver: 'ver',
        lat: 'lat',
        lon: 'lon',
        eqpt: 'eqpt'
      }
    }
  end

  describe '#call' do
    context 'when the fsacars_connection is valid' do
      it 'creates an fsacars_connection' do
        expect { context }.to change { FsacarsConnection.count }.by(1)
      end
    end

    context 'when the fsacars_connection is invalid' do
      let(:params) do
        {
          user_id: 0,
          user_query: {
            user: user.email,
            pass: 'pass',
            auth: 'auth',
            ver: 'ver',
            lat: 'lat',
            lon: 'lon',
            eqpt: 'eqpt'
          }
        }
      end

      it 'does not create an fsacars_connection' do
        expect { context }.to change { FsacarsConnection.count }.by(0)
      end
    end
  end
end
