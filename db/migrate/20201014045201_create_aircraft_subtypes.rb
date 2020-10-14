class CreateAircraftSubtypes < ActiveRecord::Migration[6.0]
  def change
    create_table :aircraft_subtypes do |t|
      t.references :aircraft, null: false, foreign_key: true
      t.references :subtype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
