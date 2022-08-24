require 'rails_helper'

RSpec.describe Fleet, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:aircraft_model) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:hub) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:aircraft_model) }
    it { is_expected.to belong_to(:location).class_name('Airport') }
    it { is_expected.to belong_to(:hub).class_name('Airport') }
  end

  describe 'Enums' do
    it { is_expected.to define_enum_for(:status)
                          .with_values({ unavailable: 0, available: 1 }) }
  end
end
