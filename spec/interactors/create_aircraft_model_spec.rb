# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateAircraftModel, type: :interactor do
  subject(:context) { described_class.call(permitted_params:) }

  let(:permitted_params) { { description: 'Boeing', maker: 'http://0.0.0.0/img' } }

  describe '#call' do
    context 'when the aircraft_model is valid' do
      it 'creates an aircraft model' do
        expect(context.aircraft_model).to be_persisted
      end
    end
  end
end
