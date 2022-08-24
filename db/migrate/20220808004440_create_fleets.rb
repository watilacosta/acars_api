class CreateFleets < ActiveRecord::Migration[7.0]
  def change
    create_table :fleets do |t|
      t.references :aircraft_model, null: false, foreign_key: true
      t.string :designator
      t.string :cover
      t.string :turbulence_category
      t.references :location, null: false, foreign_key: { to_table: :airports }
      t.integer :status
      t.references :hub, null: false, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
