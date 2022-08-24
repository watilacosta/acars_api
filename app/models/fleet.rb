class Fleet < ApplicationRecord
  belongs_to :aircraft_model
  belongs_to :location, class_name: 'Airport', foreign_key: 'location_id'
  belongs_to :hub, class_name: 'Airport', foreign_key: 'hub_id'

  enum status: { unavailable: 0, available: 1 }

  validates :aircraft_model, :location, :hub, presence: true
end
