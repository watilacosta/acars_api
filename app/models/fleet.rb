class Fleet < ApplicationRecord
  belongs_to :aircraft_model
  belongs_to :location, class_name: 'Airport', foreign_key: 'location_id'
  belongs_to :hub, class_name: 'Airport', foreign_key: 'hub_id'
end
