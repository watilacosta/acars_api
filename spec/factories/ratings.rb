# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
#  id          :bigint           not null, primary key
#  description :string
#  min_hours   :string           not null
#  icon        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :rating do
    description { Faker::Lorem.sentence }
    min_hours { Faker::Number.number(digits: 3) }
    icon { Faker::Internet.url(host: 'example.com', path: '/image') }
  end
end
