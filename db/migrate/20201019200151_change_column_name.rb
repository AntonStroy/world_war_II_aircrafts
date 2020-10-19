class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :aircrafts, :type, :aircraft_type
  end
end
