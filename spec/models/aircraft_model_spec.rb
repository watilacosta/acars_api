# frozen_string_literal: true

# == Schema Information
#
# Table name: aircraft_models
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  maker       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe AircraftModel, type: :model do
  describe 'validations' do
    subject { build(:aircraft_model) }

    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(20) }
    it { is_expected.to validate_uniqueness_of(:description) }
    it { is_expected.to validate_presence_of(:maker) }
    it { is_expected.to validate_length_of(:maker).is_at_most(50) }
  end
end
