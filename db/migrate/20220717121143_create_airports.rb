# frozen_string_literal: true

class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :icao, null: false, unique: true
      t.string :name, null: false
      t.string :lat, null: false
      t.string :lon, null: false

      t.timestamps
    end
  end
end
