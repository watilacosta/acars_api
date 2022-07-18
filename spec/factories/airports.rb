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
FactoryBot.define do
  factory :airport do
    icao { Faker::Lorem.characters(number: 4) }
    name { Faker::Lorem.word }
    lat { Faker::Address.latitude }
    lon { Faker::Address.longitude }
  end
end
