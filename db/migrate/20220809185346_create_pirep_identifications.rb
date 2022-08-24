class CreatePirepIdentifications < ActiveRecord::Migration[7.0]
  def change
    create_table :pirep_identifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :authentication
      t.string :fsacars_version
      t.string :fsversion

      t.timestamps
    end
  end
end
