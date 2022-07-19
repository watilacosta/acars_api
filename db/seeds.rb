# frozen_string_literal: true

require 'csv'

p 'Creating airports...'
CSV.foreach('db/data/airports.csv', headers: true) do |row|
  Airport.create!(
    icao: row[0],
    name: row[1],
    lat: row[2],
    lon: row[3]
  )

  p "Created airport #{row[0]}"
rescue ActiveRecord::RecordInvalid => e
  p "Error creating airport #{row[0]}: #{e.message}"
end

p "Created airports: #{Airport.count}"

# SBSJ