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
FactoryBot.define do
  factory :aircraft_model do
    description { Faker::Lorem.sentence(word_count: 1) }
    maker { %i[Boeing Airbus Embraer Cesnna Pipper].sample }
  end
end
