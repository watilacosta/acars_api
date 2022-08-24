class CreateFsacarsConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :fsacars_connections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pass
      t.string :auth
      t.string :version
      t.string :lat
      t.string :lon
      t.string :eqpt

      t.timestamps
    end
  end
end
