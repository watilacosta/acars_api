# frozen_string_literal: true

# == Schema Information
#
# Table name: airports
#
#  id         :bigint           not null, primary key
#  icao       :string           not null
#  name       :string           not null
#  lat        :string           not null
#  lon        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Airport, type: :model do
  describe 'validations' do
    subject { build(:airport) }

    it { is_expected.to validate_presence_of(:icao) }
    it { is_expected.to validate_length_of(:icao).is_at_most(4) }
    it { is_expected.to validate_uniqueness_of(:icao) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { is_expected.to validate_presence_of(:lat) }
    it { is_expected.to validate_length_of(:lat).is_at_most(20) }
    it { is_expected.to validate_presence_of(:lon) }
    it { is_expected.to validate_length_of(:lon).is_at_most(20) }
  end
end
