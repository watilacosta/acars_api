# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  firstname              :string
#  lastname               :string
#  callsign               :string
#  rating_id              :bigint
#  status                 :integer          default("inactive")
#  profile                :integer          default("pilot")
#  total_hours            :time             default(Sat, 01 Jan 2000 00:00:00.000000000 UTC +00:00)
#  total_flights          :integer          default(0)
#  landing_fps            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string(128)
#  remember_token         :string(128)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_length_of(:callsign).is_at_most(7) }
    it { is_expected.to validate_presence_of(:callsign) }
    it { is_expected.to validate_length_of(:firstname).is_at_most(50) }
    it { is_expected.to validate_length_of(:lastname).is_at_most(50) }
    it { is_expected.to validate_presence_of(:rating) }
  end


  # associations
  it { is_expected.to belong_to(:rating) }
end
