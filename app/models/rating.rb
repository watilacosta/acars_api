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
class Rating < ApplicationRecord
  validates :min_hours, :description, presence: true
  validates :description, length: { maximum: 50 }
end
