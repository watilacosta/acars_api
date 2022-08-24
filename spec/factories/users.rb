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
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    callsign { 'ABC123' }
    rating
    status { 0 }
    profile { 0 }
  end
end
