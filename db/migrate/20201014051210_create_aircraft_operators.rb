class CreateAircraftOperators < ActiveRecord::Migration[6.0]
  def change
    create_table :aircraft_operators do |t|
      t.references :aircraft, null: false, foreign_key: true
      t.references :operator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
