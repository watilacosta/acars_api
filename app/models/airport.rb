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
class Airport < ApplicationRecord
  validates :icao, presence: true, length: { maximum: 4 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :lat, presence: true, length: { maximum: 20 }
  validates :lon, presence: true, length: { maximum: 20 }
end
