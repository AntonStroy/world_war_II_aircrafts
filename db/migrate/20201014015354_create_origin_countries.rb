class CreateOriginCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :origin_countries do |t|
      t.string :name

      t.timestamps
    end
  end
end
