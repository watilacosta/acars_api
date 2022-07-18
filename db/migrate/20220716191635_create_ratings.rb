# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.string :description, max: 50
      t.string :min_hours, null: false
      t.string :icon
      t.timestamps
    end
  end
end
