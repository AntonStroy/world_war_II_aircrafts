class CreateAircrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :aircrafts do |t|
      t.string :name
      t.string :type
      t.integer :service_start
      t.integer :units_build
      t.decimal :unit_price
      t.references :origin_country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
