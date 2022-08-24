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
class AircraftModel < ApplicationRecord
  validates :description, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :maker, presence: true, length: { maximum: 50 }
end
