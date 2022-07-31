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
class AircraftModelSerializer < BaseSerializer # :nodoc:
  attributes :description, :maker
end
