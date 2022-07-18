# frozen_string_literal: true

class CreateAircraftModels < ActiveRecord::Migration[7.0]
  def change
    create_table :aircraft_models do |t|
      t.string :description, null: false
      t.string :maker, null: false

      t.timestamps
    end
  end
end
